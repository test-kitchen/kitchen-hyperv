require "fileutils" unless defined?(FileUtils)
require "logger" unless defined?(Logger)
require "stringio" unless defined?(StringIO)
require "tmpdir" unless defined?(Dir.mktmpdir)

# Helpers for building a fully finalized driver wired to a FakeTrainConnection.
module DriverHelpers
  # JSON the fake host returns for `Get-DefaultVMSwitch`.
  DEFAULT_SWITCH = { "Name" => "Default Switch", "Id" => "b1e4a0d0-switch" }.freeze

  # JSON the fake host returns for `New-KitchenVM`.
  NEW_VM = { "Name" => "coolbeans", "Id" => "vm-0001", "State" => "Running" }.freeze

  # JSON the fake host returns for `Get-VmDetail`.
  VM_DETAIL = { "Name" => "coolbeans", "Id" => "vm-0001", "IpAddress" => "192.168.1.50" }.freeze

  # JSON the fake host returns for `Assert-VmRunning`.
  RUNNING_VM = { "Name" => "coolbeans", "Id" => "vm-0001", "State" => "Running" }.freeze

  # Responses that make a plain `create` succeed. Specs override individual
  # entries by calling #stub_script again, since later stubs win.
  def apply_default_stubs(connection)
    connection.stub_script(/Get-DefaultVMSwitch/, json: DEFAULT_SWITCH)
    connection.stub_script(/New-KitchenVM/, json: NEW_VM)
    connection.stub_script(/Get-VmDetail/, json: VM_DETAIL)
    connection.stub_script(/Assert-VmRunning/, json: RUNNING_VM)
    connection
  end
end

RSpec.shared_context "a hyperv driver" do
  include DriverHelpers

  # A real directory standing in for the parent VHD folder, so `vhd_folder?` and
  # `vhd?` exercise the genuine filesystem checks rather than stubbed ones.
  let(:vhd_folder) { Dir.mktmpdir("kitchen-hyperv-vhd") }
  let(:kitchen_root) { Dir.mktmpdir("kitchen-hyperv-root") }
  let(:parent_vhd_name) { "windows-2022.vhdx" }

  let(:logged_output) { StringIO.new }
  let(:logger) { Logger.new(logged_output) }

  let(:connection) { apply_default_stubs(FakeTrainConnection.new) }

  # The connection Test Kitchen's transport hands back, used to wait for the
  # guest during create and to close it during destroy.
  let(:transport_connection) do
    instance_double(Kitchen::Transport::Base::Connection, wait_until_ready: true, close: true)
  end

  let(:transport) do
    instance_double(Kitchen::Transport::Base, connection: transport_connection)
  end

  let(:instance) do
    instance_double(
      Kitchen::Instance,
      name: "coolbeans",
      to_str: "<coolbeans>",
      logger: logger,
      transport: transport
    )
  end

  # Config overrides; individual examples redefine this with `let`.
  let(:driver_config) { {} }

  let(:config) do
    {
      kitchen_root: kitchen_root,
      parent_vhd_folder: vhd_folder,
      parent_vhd_name: parent_vhd_name,
    }.merge(driver_config)
  end

  let(:state) { {} }

  let(:driver) { Kitchen::Driver::Hyperv.new(config).finalize_config!(instance) }

  before do
    FileUtils.touch(File.join(vhd_folder, parent_vhd_name))
    FileUtils.mkdir_p(File.join(kitchen_root, ".kitchen", "coolbeans"))

    allow(Train).to receive(:create) do |backend, options|
      FakeTrainTransport.new(backend, options, connection)
    end
  end

  after do
    [vhd_folder, kitchen_root].each do |dir|
      FileUtils.remove_entry(dir) if Dir.exist?(dir)
    end
  end
end
