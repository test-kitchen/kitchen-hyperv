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

  spec.required_ruby_version = ">= 2.6"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.3", "< 5.18"
  spec.add_development_dependency "minitest-stub-const"
  spec.add_development_dependency "mocha", "~> 1.1"

  spec.add_dependency "test-kitchen", ">= 1.4", "< 4"
  spec.add_dependency "train", "~> 3.5"
  spec.add_dependency "train-winrm", "~> 0.2"
end
