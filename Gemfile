source "https://rubygems.org"

gemspec development_group: :test

# Everything needed to run `rake spec` and `rake style`. Deliberately small:
# the unit suite fakes the Train connection, so it needs neither Hyper-V nor
# any other Test Kitchen plugin to run on any platform.
group :test do
  gem "rake"
  gem "rspec", "~> 3.13"
end

# Only needed to drive a real VM via `kitchen test` against a Hyper-V host.
# Skip with: bundle config set --local without integration
group :integration do
  gem "berkshelf"
  gem "kitchen-dokken"
  gem "kitchen-inspec"
  gem "kitchen-vagrant"
end

group :development do
  gem "pry"
  gem "pry-byebug"
  gem "pry-stack_explorer"
end

group :docs do
  gem "yard"
end

group :cookstyle do
  gem "cookstyle"
end
