require "base64" unless defined?(Base64)
require "json" unless defined?(JSON)

# A stand-in for a Train connection.
#
# The driver's real work is turning configuration into PowerShell and running it
# in the right order, so the specs fake only the true outer boundary -- the Train
# connection -- and let everything above it run for real. Every command therefore
# travels the genuine `run_ps` -> `wrap_command` -> `encode_command` path, and this
# object decodes the `-encodedcommand` payload back to readable PowerShell so specs
# can assert on the script that would actually have reached the host.
class FakeTrainConnection
  # The shape Train's `run_command` returns.
  CommandResult = Struct.new(:stdout, :stderr, :exit_status)

  # Every command run, in order, as decoded PowerShell.
  attr_reader :scripts

  # Every raw command line run, in order, before decoding.
  attr_reader :command_lines

  # Every [local, remote] pair passed to #upload.
  attr_reader :uploads

  # True once #close has been called.
  attr_reader :closed

  def initialize
    @scripts = []
    @command_lines = []
    @uploads = []
    @stubs = []
    @closed = false
  end

  # Queue a canned response for any script matching +matcher+.
  #
  # Later stubs win over earlier ones, so a spec can override a default set up in
  # a shared helper. Exactly one of +json+ or +stdout+ is normally given.
  def stub_script(matcher, json: nil, stdout: nil, stderr: "", exit_status: 0)
    body = json.nil? ? stdout.to_s : JSON.generate(json)
    @stubs.unshift([matcher, CommandResult.new(body, stderr, exit_status)])
    self
  end

  # The decoded PowerShell of the last command run.
  def last_script
    scripts.last
  end

  # All decoded scripts matching +matcher+.
  def scripts_matching(matcher)
    scripts.grep(matcher)
  end

  # True if any command run so far matched +matcher+.
  def ran?(matcher)
    scripts.any? { |s| matcher === s }
  end

  # Train::Plugins::Transport::BaseConnection#run_command
  def run_command(cmd, _options = {})
    @command_lines << cmd
    script = decode(cmd)
    @scripts << script

    _, result = @stubs.find { |matcher, _| matcher === script }
    result || CommandResult.new("", "", 0)
  end

  # Train::Plugins::Transport::BaseConnection#upload
  def upload(local, remote)
    @uploads << [local, remote]
  end

  def close
    @closed = true
  end

  private

  # Reverse `encode_command`: pull the Base64 payload out of the command line and
  # turn it back into the UTF-8 PowerShell the driver generated.
  def decode(cmd)
    encoded = cmd[/-encodedcommand\s+(\S+)/, 1]
    return cmd if encoded.nil?

    Base64.decode64(encoded).force_encoding("UTF-16LE").encode("UTF-8")
  end
end

# A stand-in for the object Train.create returns.
class FakeTrainTransport
  attr_reader :backend, :options, :connection

  def initialize(backend, options, connection)
    @backend = backend
    @options = options
    @connection = connection
  end
end
