require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)

  desc "Run the unit tests"
  task unit: :spec

  desc "Run all test suites"
  task test: :spec
rescue LoadError
  puts "rspec is not available. (sudo) gem install rspec to run the unit tests."
end

begin
  require "cookstyle/chefstyle"
  require "rubocop/rake_task"
  RuboCop::RakeTask.new(:style) do |task|
    task.options += ["--display-cop-names", "--no-color"]
  end
rescue LoadError
  puts "cookstyle/chefstyle is not available. (sudo) gem install cookstyle to do style checking."
end

desc "Run all quality tasks"
task quality: :style

begin
  require "yard" unless defined?(YARD)

  YARD::Rake::YardocTask.new(:yard) do |task|
    task.stats_options = ["--list-undoc"]
  end

  namespace :yard do
    desc "Report documentation coverage and list undocumented objects"
    task :stats do
      sh "yard stats --list-undoc"
    end

    desc "Serve the documentation at http://localhost:8808, reloading on change"
    task :server do
      sh "yard server --reload"
    end
  end
rescue LoadError
  puts "yard is not available. (sudo) gem install yard to generate yard documentation."
end

desc "Run the PowerShell (Pester) tests for support/hyperv.ps1"
task :pester do
  pwsh = %w{pwsh powershell}.find do |candidate|
    system("which #{candidate} > /dev/null 2>&1") || system("where #{candidate} > NUL 2>&1")
  end

  abort "PowerShell was not found on PATH; install PowerShell 7+ to run the Pester tests." unless pwsh

  sh pwsh, "-NoProfile", "-NonInteractive", "-File", File.join(__dir__, "spec", "powershell", "run_tests.ps1")
end

# `yard` is deliberately not a prerequisite of `default`: documentation coverage
# should never be able to fail a build.
task default: %i{test quality}
