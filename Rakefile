# -*- encoding: utf-8 -*-

require "bundler/gem_tasks"
require "kitchen/driver/hyperv_version"

require "rake/testtask"
Rake::TestTask.new(:unit) do |t|
  t.libs.push "lib"
  t.test_files = FileList["spec/**/*_spec.rb"]
  t.verbose = true
end

desc "Run all test suites"
task :test => [:unit]

desc "Display LOC stats"
task :stats do
  puts "\n## Production Code Stats"
  sh "countloc -r lib"
  puts "\n## Test Code Stats"
  sh "countloc -r spec"
end

task :default => [:test]

begin
  require "github_changelog_generator/task"

  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = "v#{Kitchen::Driver::HYPERV_VERSION}"
    config.issues = false
    config.pulls = true
    config.user = 'test-kitchen'
    config.project = 'kitchen-hyperv'
  end
rescue LoadError
  puts "github_changelog_generator is not available. " \
    "gem install github_changelog_generator to generate changelogs"
end
