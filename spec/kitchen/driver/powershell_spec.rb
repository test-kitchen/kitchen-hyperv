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

require "base64" unless defined?(Base64)
require "open3" unless defined?(Open3)

RSpec.describe Kitchen::Driver::PowerShellScripts do
  include_context "a hyperv driver"

  # The module is only ever used mixed into the driver, where it reads `config`,
  # `@state` and `instance`. Exercising it through a real driver keeps the specs
  # honest about that coupling instead of inventing a host class that hides it.
  subject(:ps) { driver }

  def generate(method, *args)
    ps.send(method, *args)
  end

  describe "#encode_command" do
    it "encodes the script as Base64-wrapped UTF-16LE, as powershell.exe expects" do
      encoded = generate(:encode_command, "Get-VM")

      expect(Base64.strict_decode64(encoded).force_encoding("UTF-16LE").encode("UTF-8"))
        .to eq("Get-VM")
    end

    it "round-trips non-ASCII characters" do
      encoded = generate(:encode_command, 'Set-VM -Note "café ☕"')

      expect(Base64.strict_decode64(encoded).force_encoding("UTF-16LE").encode("UTF-8"))
        .to eq('Set-VM -Note "café ☕"')
    end

    it "emits strict Base64 with no embedded newlines" do
      long_script = "Get-VM -Name #{"a" * 500}"

      expect(generate(:encode_command, long_script)).not_to include("\n")
    end

    it "does not depend on another gem having required base64 first" do
      script = "require './lib/kitchen/driver/powershell'; print defined?(Base64).inspect"
      stdout, _stderr, status = Open3.capture3(RbConfig.ruby, "-e", script)

      expect(status).to be_success
      expect(stdout).to eq('"constant"')
    end
  end

  describe "#wrap_command" do
    subject(:wrapped) { generate(:wrap_command, "Get-VM") }

    it "dot-sources the support script so the helper functions are defined" do
      decoded = Base64.strict_decode64(wrapped[/-encodedcommand (\S+)/, 1])
        .force_encoding("UTF-16LE").encode("UTF-8")

      expect(decoded).to eq(". #{ps.send(:base_script_path)};\nGet-VM")
    end

    it "disables the profile and the execution policy" do
      expect(wrapped).to include("-noprofile", "-executionpolicy bypass")
    end

    it "requests text output so the JSON survives the round trip" do
      expect(wrapped).to include("-outputformat Text")
    end
  end

  describe "#powershell_64_bit" do
    before { allow(ENV).to receive(:[]).and_call_original }

    def with_arch(value)
      allow(ENV).to receive(:[]).with("PROCESSOR_ARCHITEW6432").and_return(nil)
      allow(ENV).to receive(:[]).with("PROCESSOR_ARCHITECTURE").and_return(value)
    end

    it "uses the native System32 powershell on a matched 64-bit host" do
      with_arch("AMD64")

      expect(generate(:powershell_64_bit))
        .to eq('c:\windows\system32\windowspowershell\v1.0\powershell.exe')
    end

    it "uses Sysnative to escape WOW64 when a 32-bit Ruby runs on a 64-bit OS" do
      # PROCESSOR_ARCHITEW6432 is only set for a 32-bit process on 64-bit
      # Windows, and is the one signal that sees through the redirector.
      allow(ENV).to receive(:[]).with("PROCESSOR_ARCHITEW6432").and_return("AMD64")
      allow(ENV).to receive(:[]).with("PROCESSOR_ARCHITECTURE").and_return("x86")
      allow(ps).to receive(:ruby_architecture_bits).and_return(32)

      expect(generate(:powershell_64_bit))
        .to eq('c:\windows\sysnative\windowspowershell\v1.0\powershell.exe')
    end

    it "uses the native System32 powershell on a genuinely 32-bit host" do
      with_arch("x86")
      allow(ps).to receive(:ruby_architecture_bits).and_return(32)

      expect(generate(:powershell_64_bit))
        .to eq('c:\windows\system32\windowspowershell\v1.0\powershell.exe')
    end

    it "uses the native System32 powershell on a 64-bit ARM host" do
      with_arch("ARM64")

      expect(generate(:powershell_64_bit))
        .to eq('c:\\windows\\system32\\windowspowershell\\v1.0\\powershell.exe')
    end

    it "treats an ARM64 host as 64-bit" do
      with_arch("ARM64")

      expect(ps.send(:sixty_four_bit?)).to be(true)
    end

    context "when the host is remote" do
      let(:driver_config) { { hyperv_server: "hv01.example.com" } }

      it "assumes 64-bit, since the local architecture is irrelevant" do
        with_arch("x86")

        expect(generate(:powershell_64_bit))
          .to eq('c:\windows\system32\windowspowershell\v1.0\powershell.exe')
      end
    end
  end

  describe "#run_ps" do
    it "runs the script and returns the parsed JSON payload" do
      connection.stub_script(/Get-Thing/, json: { "Name" => "thing" })

      expect(generate(:run_ps, "Get-Thing")).to eq("Name" => "thing")
    end

    it "returns nil when the script produces no output" do
      expect(generate(:run_ps, "Set-Something")).to be_nil
    end

    it "raises with the host's stderr when the command fails" do
      connection.stub_script(/Get-Thing/, stdout: "", stderr: "Hyper-V is not installed", exit_status: 1)

      expect { generate(:run_ps, "Get-Thing") }
        .to raise_error(/Hyper-V is not installed/)
    end

    context "with dry_run enabled" do
      let(:driver_config) { { dry_run: true } }

      it "echoes the script rather than executing it" do
        generate(:run_ps, "Remove-VM")

        expect(connection.last_script).to include("echo Remove-VM")
      end
    end
  end

  describe "#sanitize_stdout" do
    it "drops the interactive prompt lines PowerShell interleaves with output" do
      raw = "PS C:\\> Get-VM\n{\"Name\":\"vm\"}\nPS C:\\>"

      expect(generate(:sanitize_stdout, raw)).to eq('{"Name":"vm"}')
    end

    it "leaves genuine output untouched" do
      expect(generate(:sanitize_stdout, "{\n\"Name\": \"vm\"\n}")).to eq("{\n\"Name\": \"vm\"\n}")
    end
  end

  describe "#ruby_array_to_ps_array" do
    it "renders an empty PowerShell array for nil" do
      expect(generate(:ruby_array_to_ps_array, nil)).to eq("@()")
    end

    it "renders an empty PowerShell array for an empty list" do
      expect(generate(:ruby_array_to_ps_array, [])).to eq("@()")
    end

    it "renders a PowerShell array literal for a populated list" do
      expect(generate(:ruby_array_to_ps_array, ["8.8.8.8", "8.8.4.4"]))
        .to eq('@("8.8.8.8", "8.8.4.4")')
    end
  end

  describe "script generation" do
    before { driver.instance_variable_set(:@state, { id: "vm-0001" }) }

    it "creates the differencing disk from the parent VHD" do
      expect(generate(:new_differencing_disk_ps))
        .to include(%{New-DifferencingDisk -Path "#{ps.send(:differencing_disk_path)}"})
        .and include(%{-ParentPath "#{ps.send(:parent_vhd_path)}"})
    end

    it "sizes additional disks in gigabytes" do
      expect(generate(:new_additional_disk_ps, 'C:\disks\data.vhdx', 25))
        .to include(%{New-VHD -Path "C:\\disks\\data.vhdx" -SizeBytes 25GB})
    end

    it "asserts the VM is running by id" do
      expect(generate(:ensure_vm_running_ps)).to include('Assert-VmRunning -ID "vm-0001"')
    end

    it "fetches VM detail by id" do
      expect(generate(:vm_details_ps)).to include('Get-VmDetail -id "vm-0001"')
    end

    it "forces the VM off before removing it" do
      script = generate(:delete_vm_ps)

      expect(script).to include('Get-VM -ID "vm-0001"')
      expect(script).to include("Stop-VM -Force -TurnOff -PassThru")
      expect(script).to include("Remove-VM -Force")
    end

    it "converts every query to JSON so the driver can parse it" do
      %i{ensure_vm_running_ps vm_details_ps vm_default_switch_ps}.each do |method|
        expect(generate(method)).to include("ConvertTo-Json"), "#{method} must emit JSON"
      end
    end

    describe "#new_vm_ps" do
      let(:driver_config) do
        {
          vm_generation: 2,
          disable_secureboot: true,
          memory_startup_bytes: 1_073_741_824,
          processor_count: 8,
          static_mac_address: "00155D01B532",
          vm_switch: "External",
          vm_vlan_id: 42,
          enable_guest_services: true,
          boot_iso_path: 'C:\iso\boot.iso',
        }
      end

      subject(:script) { generate(:new_vm_ps) }

      it "passes the configured hardware settings through to New-KitchenVM" do
        expect(script).to include("Generation = 2")
        expect(script).to include("MemoryStartupBytes = 1073741824")
        expect(script).to include("ProcessorCount = 8")
        expect(script).to include("VlanId = 42")
        expect(script).to include(%{StaticMacAddress = "00155D01B532"})
        expect(script).to include(%{SwitchName = "External"})
        expect(script).to include(%{boot_iso_path = "C:\\iso\\boot.iso"})
      end

      it "splats the parameters into New-KitchenVM" do
        expect(script).to include("New-KitchenVM @NewVMParams | ConvertTo-Json")
      end

      context "without a VLAN" do
        let(:driver_config) { {} }

        it "passes a PowerShell null so the host skips VLAN configuration" do
          expect(script).to include("VlanId = $null")
        end
      end
    end

    describe "#additional_disks" do
      it "is omitted entirely when no additional disks are configured" do
        expect(generate(:additional_disks)).to be_nil
      end

      context "when additional disks are configured" do
        let(:driver_config) { { additional_disks: [{ name: "data" }] } }

        it "renders the created disk paths as a PowerShell array" do
          driver.instance_variable_set(:@additional_disk_objects, ['C:\a.vhdx', 'C:\b.vhdx'])

          expect(generate(:additional_disks))
            .to include(%{AdditionalDisks = @("C:\\a.vhdx","C:\\b.vhdx")})
        end
      end
    end

    describe "#set_vm_ipaddress_ps" do
      let(:driver_config) do
        {
          ip_address: "192.168.1.50",
          subnet: "255.255.255.0",
          gateway: "192.168.1.1",
          dns_servers: ["8.8.8.8"],
        }
      end

      it "waits for the network adapter before configuring it" do
        expect(generate(:set_vm_ipaddress_ps)).to include("NetworkAdapters[0].Status -ne 'Ok'")
      end

      it "passes the addressing configuration to Set-VMNetworkConfiguration" do
        script = generate(:set_vm_ipaddress_ps)

        expect(script).to include(%{-ipaddress "192.168.1.50"})
        expect(script).to include(%{-subnet "255.255.255.0"})
        expect(script).to include(%{-gateway "192.168.1.1"})
        expect(script).to include(%{-dnsservers @("8.8.8.8")})
      end
    end

    it "resizes the parent VHD to the configured size" do
      driver.send(:config)[:resize_vhd] = 42_949_672_960

      expect(generate(:resize_vhd))
        .to include(%{Resize-VHD -Path "#{ps.send(:parent_vhd_path)}" -SizeBytes 42949672960})
    end

    it "sets the VM note by looking the VM up by id" do
      driver.send(:config)[:vm_note] = "built by kitchen"

      expect(generate(:set_vm_note))
        .to include(%{$_.ID -eq "vm-0001"}).and include(%{-Note "built by kitchen"})
    end

    it "mounts an ISO by id" do
      driver.send(:config)[:iso_path] = 'C:\iso\tools.iso'

      expect(generate(:mount_vm_iso)).to include(%{mount-vmiso -id "vm-0001" -Path C:\\iso\\tools.iso})
    end

    describe "#copy_vm_file_ps" do
      subject(:script) { generate(:copy_vm_file_ps, 'C:\src', 'C:\dest') }

      it "guards on the source existing before copying" do
        expect(script).to include("If (Test-Path $sourceLocation)")
        expect(script).to include("Write-Error \"Source file path does not exist:")
      end

      it "enables the guest service interface when it is not already on" do
        expect(script).to include("Enable-VMIntegrationService -Name $service -VM $vm")
      end

      it "walks a directory source file by file" do
        expect(script).to include("Get-ChildItem -Path $sourceLocation -File")
      end
    end
  end
end
