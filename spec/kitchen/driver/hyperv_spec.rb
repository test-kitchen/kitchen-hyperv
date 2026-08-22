#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RSpec.describe Kitchen::Driver::Hyperv do
  include_context "a hyperv driver"

  describe "plugin metadata" do
    it "declares driver API version 2" do
      expect(driver.diagnose_plugin[:api_version]).to eq(2)
    end

    it "reports the gem version as its plugin version" do
      expect(driver.diagnose_plugin[:version]).to eq(Kitchen::Driver::HYPERV_VERSION)
    end
  end

  describe "configuration" do
    it "defaults to a 512MB, 2-processor, generation 1 VM" do
      expect(driver[:memory_startup_bytes]).to eq(536_870_912)
      expect(driver[:processor_count]).to eq(2)
      expect(driver[:vm_generation]).to eq(1)
    end

    it "leaves dynamic memory and secure boot changes off by default" do
      expect(driver[:dynamic_memory]).to be(false)
      expect(driver[:disable_secureboot]).to be(false)
    end

    it "derives the disk type from the parent VHD's extension" do
      expect(driver[:disk_type]).to eq(".vhdx")
    end

    context "with a .vhd parent disk" do
      let(:parent_vhd_name) { "windows-2016.vhd" }

      it "derives .vhd" do
        expect(driver[:disk_type]).to eq(".vhd")
      end
    end

    it "defaults remote connections to SSL-less and certificate-insecure" do
      expect(driver[:hyperv_ssl]).to be(false)
      expect(driver[:hyperv_insecure]).to be(true)
    end

    it "requires a parent VHD folder and name" do
      expect(described_class.validations).to have_key(:parent_vhd_folder)
      expect(described_class.validations).to have_key(:parent_vhd_name)
    end
  end

  describe "#create" do
    it "creates the differencing disk before creating the VM" do
      driver.create(state)

      disk = connection.scripts.index { |s| s.include?("New-DifferencingDisk") }
      vm = connection.scripts.index { |s| s.include?("New-KitchenVM") }

      expect(disk).to be < vm
    end

    it "records the VM id, name and address in the state" do
      driver.create(state)

      expect(state).to include(
        id: "vm-0001",
        hostname: "192.168.1.50",
        vm_name: "coolbeans"
      )
    end

    it "resolves the default VM switch and passes it to New-KitchenVM" do
      driver.create(state)

      expect(connection.scripts_matching(/New-KitchenVM/).first)
        .to include(%{SwitchName = "Default Switch"})
    end

    it "waits for the transport to become ready before copying files in" do
      driver.create(state)

      expect(transport_connection).to have_received(:wait_until_ready)
    end

    it "raises when no default VM switch can be found" do
      connection.stub_script(/Get-DefaultVMSwitch/, stdout: "")

      expect { driver.create(state) }.to raise_error(/Failed to find a default VM Switch/)
    end

    it "raises when the host returns a switch with an empty name" do
      connection.stub_script(/Get-DefaultVMSwitch/, json: { "Name" => "" })

      expect { driver.create(state) }.to raise_error(/Failed to find a default VM Switch/)
    end

    it "raises when the VM cannot be created" do
      connection.stub_script(/New-KitchenVM/, stdout: "")

      expect { driver.create(state) }.to raise_error(/Unable to create virtual machine/)
    end

    it "raises a clear error when the host reports no detail for the new VM" do
      connection.stub_script(/Get-VmDetail/, stdout: "")

      expect { driver.create(state) }
        .to raise_error(/Unable to fetch details for virtual machine/)
    end

    it "skips creating a VM that already exists" do
      state[:id] = "vm-0001"

      driver.create(state)

      expect(connection.ran?(/New-KitchenVM/)).to be(false)
    end

    context "with an ISO to mount" do
      let(:driver_config) { { iso_path: 'C:\iso\tools.iso' } }

      it "mounts the ISO after the VM has an id" do
        driver.create(state)

        expect(connection.ran?(/mount-vmiso -id "vm-0001"/)).to be(true)
      end
    end

    context "without an ISO" do
      it "does not mount anything" do
        driver.create(state)

        expect(connection.ran?(/mount-vmiso/)).to be(false)
      end
    end

    context "with a VM note" do
      let(:driver_config) { { vm_note: "kitchen suite: default" } }

      it "sets the note on the VM" do
        driver.create(state)

        expect(connection.ran?(/-Note "kitchen suite: default"/)).to be(true)
      end
    end

    context "with resize_vhd set" do
      let(:driver_config) { { resize_vhd: 64_424_509_440 } }

      it "resizes the disk right after creating it" do
        driver.create(state)

        expect(connection.ran?(/Resize-VHD .* -SizeBytes 64424509440/)).to be(true)
      end
    end

    context "with files to copy into the guest" do
      let(:driver_config) do
        { copy_vm_files: [{ source: 'C:\tools', dest: 'C:\dest' }] }
      end

      it "copies them only after the transport is ready" do
        driver.create(state)

        expect(connection.ran?(/Copy-VMFile/)).to be(true)
        expect(transport_connection).to have_received(:wait_until_ready)
      end
    end

    context "with a static IP address" do
      let(:driver_config) do
        { ip_address: "192.168.1.50", gateway: "192.168.1.1", dns_servers: ["8.8.8.8"] }
      end

      it "configures the address before reading the VM's details" do
        driver.create(state)

        set = connection.scripts.index { |s| s.include?("Set-VMNetworkConfiguration") }
        detail = connection.scripts.index { |s| s.include?("Get-VmDetail") }

        expect(set).to be < detail
      end
    end
  end

  describe "validation" do
    context "when the parent VHD folder does not exist" do
      let(:driver_config) { { parent_vhd_folder: File.join(Dir.tmpdir, "definitely-not-here") } }

      it "refuses to create the VM" do
        expect { driver.create(state) }.to raise_error(/Missing parent_vhd_folder/)
      end
    end

    context "when the parent VHD file does not exist" do
      let(:driver_config) { { parent_vhd_name: "missing.vhdx" } }

      it "refuses to create the VM" do
        expect { driver.create(state) }.to raise_error(/Missing parent_vhd_name/)
      end
    end

    describe "dynamic memory" do
      it "accepts a startup size inside the dynamic range" do
        driver.send(:config)[:dynamic_memory] = true
        driver.send(:config)[:memory_startup_bytes] = 1_073_741_824

        expect { driver.create(state) }.not_to raise_error
      end

      it "rejects a startup size below the dynamic minimum" do
        driver.send(:config)[:dynamic_memory] = true
        driver.send(:config)[:memory_startup_bytes] = 1024

        expect { driver.create(state) }
          .to raise_error(/must fall within dynamic memory range/)
      end

      it "rejects a startup size above the dynamic maximum" do
        driver.send(:config)[:dynamic_memory] = true
        driver.send(:config)[:memory_startup_bytes] = 8_589_934_592

        expect { driver.create(state) }
          .to raise_error(/must fall within dynamic memory range/)
      end

      it "compares numerically when the sizes arrive from YAML as strings" do
        driver.send(:config)[:dynamic_memory] = true
        driver.send(:config)[:memory_startup_bytes] = "8589934592"

        expect { driver.create(state) }
          .to raise_error(/must fall within dynamic memory range/)
      end
    end

    describe "vm_vlan_id" do
      it "accepts a valid 802.1Q id" do
        driver.send(:config)[:vm_vlan_id] = 42

        expect { driver.create(state) }.not_to raise_error
      end

      it "rejects an id above the 802.1Q maximum" do
        driver.send(:config)[:vm_vlan_id] = 5000

        expect { driver.create(state) }.to raise_error(/must be a valid 802.1Q/)
      end

      it "rejects zero" do
        driver.send(:config)[:vm_vlan_id] = 0

        expect { driver.create(state) }.to raise_error(/must be a valid 802.1Q/)
      end

      it "compares numerically when the id arrives from YAML as a string" do
        driver.send(:config)[:vm_vlan_id] = "5000"

        expect { driver.create(state) }.to raise_error(/must be a valid 802.1Q/)
      end
    end
  end

  describe "additional disks" do
    let(:driver_config) do
      { additional_disks: [{ name: "data", size_gb: 40 }, { name: "logs" }] }
    end

    it "creates one disk per entry, before the VM" do
      driver.create(state)

      created = connection.scripts_matching(/New-VHD/)
      vm = connection.scripts.index { |s| s.include?("New-KitchenVM") }

      expect(created.size).to eq(2)
      expect(connection.scripts.index { |s| s.include?("New-VHD") }).to be < vm
    end

    it "defaults an unsized disk to 5GB" do
      driver.create(state)

      expect(connection.ran?(/logs\.vhdx" -SizeBytes 5GB/)).to be(true)
    end

    it "honours an explicit size" do
      driver.create(state)

      expect(connection.ran?(/data\.vhdx" -SizeBytes 40GB/)).to be(true)
    end

    it "attaches the created disks to the VM" do
      driver.create(state)

      expect(connection.scripts_matching(/New-KitchenVM/).first).to include("AdditionalDisks = @(")
    end

    it "rejects a disk with no name" do
      driver.send(:config)[:additional_disks] = [{ size_gb: 10 }]

      expect { driver.create(state) }.to raise_error(/Missing name for additional disk/)
    end

    it "refuses to clobber an existing disk file" do
      FileUtils.mkdir_p(File.join(kitchen_root, ".kitchen", "coolbeans"))
      FileUtils.touch(File.join(kitchen_root, ".kitchen", "coolbeans", "data.vhdx"))

      expect { driver.create(state) }.to raise_error(/Additional disk file already exists/)
    end

    it "removes them on destroy" do
      driver.create(state)
      disk = File.join(kitchen_root, ".kitchen", "coolbeans", "data.vhdx")
      FileUtils.touch(disk)

      driver.destroy(state)

      expect(File).not_to exist(disk)
    end
  end

  describe "#destroy" do
    before do
      driver.create(state)
      FileUtils.touch(driver.send(:differencing_disk_path))
    end

    it "closes the transport connection before removing the VM" do
      driver.destroy(state)

      expect(transport_connection).to have_received(:close)
    end

    it "removes the VM" do
      driver.destroy(state)

      expect(connection.ran?(/Remove-VM -Force/)).to be(true)
    end

    it "deletes the differencing disk" do
      path = driver.send(:differencing_disk_path)

      driver.destroy(state)

      expect(File).not_to exist(path)
    end

    it "clears the VM id from the state" do
      driver.destroy(state)

      expect(state).not_to have_key(:id)
    end

    context "when the VM is already gone" do
      before { connection.stub_script(/Assert-VmRunning/, stdout: "") }

      it "still cleans up a stale differencing disk" do
        path = driver.send(:differencing_disk_path)

        driver.destroy(state)

        expect(File).not_to exist(path)
      end

      it "does not try to remove a VM that does not exist" do
        driver.destroy(state)

        expect(connection.ran?(/Remove-VM -Force/)).to be(false)
      end

      it "clears the stale id so the next destroy is not misled by it" do
        driver.destroy(state)

        expect(state).not_to have_key(:id)
      end
    end

    context "when there is no state at all" do
      let(:state) { {} }

      it "is a no-op rather than an error" do
        expect { driver.destroy({}) }.not_to raise_error
      end
    end
  end

  describe "connecting to the host" do
    it "uses the local Train backend when no Hyper-V server is configured" do
      driver.create(state)

      expect(Train).to have_received(:create).with("local", hash_including(host: nil))
    end

    it "does not upload the support script when running locally" do
      driver.create(state)

      expect(connection.uploads).to be_empty
    end

    it "dot-sources the in-gem support script when running locally" do
      expect(driver.send(:base_script_path)).to eq(driver.send(:local_script_path))
    end

    it "resolves the support script to a real, normalized path" do
      path = driver.send(:local_script_path)

      expect(path).to eq(File.expand_path(path))
      expect(File).to exist(path)
    end

    context "against a remote Hyper-V server" do
      let(:driver_config) do
        {
          hyperv_server: "hv01.example.com",
          hyperv_username: "admin",
          hyperv_password: "s3cret",
          hyperv_ssl: true,
          hyperv_insecure: false,
        }
      end

      it "uses the WinRM Train backend with the configured credentials" do
        driver.create(state)

        expect(Train).to have_received(:create).with(
          "winrm",
          hash_including(
            host: "hv01.example.com",
            user: "admin",
            password: "s3cret",
            ssl: true,
            self_signed: false
          )
        )
      end

      it "uploads the support script to the host" do
        driver.create(state)

        expect(connection.uploads.size).to eq(1)
        expect(connection.uploads.first.last).to eq(driver.send(:remote_script_path))
      end

      it "dot-sources the uploaded copy rather than the local one" do
        expect(driver.send(:base_script_path)).to eq(driver.send(:remote_script_path))
      end

      it "places the differencing disk under remote_vm_path" do
        expect(driver.send(:differencing_disk_path))
          .to start_with('C:\Users\Public\Documents\Hyper-V')
      end

      it "skips the local parent VHD existence checks" do
        driver.send(:config)[:parent_vhd_folder] = 'D:\VHDs'
        driver.send(:config)[:parent_vhd_name] = "base.vhdx"

        expect { driver.create(state) }.not_to raise_error
      end

      context "with additional disks" do
        let(:driver_config) do
          super().merge(additional_disks: [{ name: "data" }])
        end

        it "places them under remote_vm_path rather than the local kitchen root" do
          driver.create(state)

          expect(connection.ran?(/New-VHD -Path "C:\\Users\\Public\\Documents\\Hyper-V/))
            .to be(true)
        end
      end
    end
  end

  describe "#differencing_disk_exists" do
    it "is false when the disk is absent" do
      expect(driver.send(:differencing_disk_exists)).to be(false)
    end

    it "is true when the disk is present" do
      FileUtils.mkdir_p(File.dirname(driver.send(:differencing_disk_path)))
      FileUtils.touch(driver.send(:differencing_disk_path))

      expect(driver.send(:differencing_disk_exists)).to be(true)
    end
  end
end
