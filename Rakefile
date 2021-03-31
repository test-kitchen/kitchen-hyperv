require "bundler/gem_tasks"
require "kitchen/driver/hyperv_version"

require "rake/testtask"
Rake::TestTask.new(:unit) do |t|
  t.libs.push "lib"
  t.test_files = FileList["spec/**/*_spec.rb"]
  t.verbose = true
end

desc "Run all test suites"
task test: :unit

begin
  require "chefstyle"
  require "rubocop/rake_task"
  RuboCop::RakeTask.new(:style) do |task|
    task.options += ["--display-cop-names", "--no-color"]
  end
rescue LoadError
  puts "chefstyle is not available. (sudo) gem install chefstyle to do style checking."
end

desc "Run all quality tasks"
task quality: :style

begin
  require "yard" unless defined?(YARD)
  YARD::Rake::YardocTask.new
rescue LoadError
  puts "yard is not available. (sudo) gem install yard to generate yard documentation."
end

task default: %i{test quality}
begin
  require "github_changelog_generator/task"

  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = "v#{Kitchen::Driver::HYPERV_VERSION}"
    config.issues = false
    config.pulls = true
    config.user = "test-kitchen"
    config.project = "kitchen-hyperv"
  end
rescue LoadError
  puts "github_changelog_generator is not available. " \
    "gem install github_changelog_generator to generate changelogs"
end
