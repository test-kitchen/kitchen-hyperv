lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "kitchen/driver/hyperv_version"

Gem::Specification.new do |spec|
  spec.name          = "kitchen-hyperv"
  spec.version       = Kitchen::Driver::HYPERV_VERSION
  spec.authors       = ["Steven Murawski"]
  spec.email         = ["steven.murawski@gmail.com"]
  spec.summary       = "Hyper-V Driver for Test-Kitchen"
  spec.description   = "Hyper-V Driver for Test-Kitchen"
  spec.homepage      = "https://github.com/test-kitchen/kitchen-hyperv"
  spec.license       = "Apache-2.0"

  spec.files         = %w{LICENSE kitchen-hyperv.gemspec Gemfile Rakefile support/hyperv.ps1} + Dir.glob("lib/**/*")
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"

  # Required directly by the PowerShell command encoder. base64 is a bundled
  # gem from Ruby 3.4 on, so it has to be declared rather than assumed.
  spec.add_dependency "base64", "~> 0.2"
  spec.add_dependency "test-kitchen", ">= 1.4", "< 5"
  spec.add_dependency "train", ">= 3.5", "< 4.0"
  spec.add_dependency "train-winrm", ">= 0.2", "< 1.0"
end
