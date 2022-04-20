# Kitchen::Hyperv

[![Build Status](https://dev.azure.com/test-kitchen/kitchen-hyperv/_apis/build/status/test-kitchen.kitchen-hyperv%20(1)?branchName=master)](https://dev.azure.com/test-kitchen/kitchen-hyperv/_build/latest?definitionId=5&branchName=master)

[![Gem Version](https://badge.fury.io/rb/kitchen-hyperv.svg)](http://badge.fury.io/rb/kitchen-hyperv)

This is a [Test Kitchen](https://github.com/test-kitchen/test-kitchen)
driver for Microsoft Hyper-V.

## Installation

Make sure you have hyper-v installed on your system first:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

The kitchen-hyperv driver ships as part of Chef Workstation. The easiest way to use this driver is to [Download Chef Workstation](https://www.chef.io/downloads/tools/workstation).

If you want to install the driver directly into a Ruby installation:

```sh
gem install kitchen-hyperv
```

If you're using Bundler, simply add it to your Gemfile:

```ruby
gem "kitchen-hyperv"
```

... and then run `bundle install`.

## Configuration

See the [kitchen.ci Hyper-V Driver Page](https://kitchen.ci/docs/drivers/hyperv/) for documentation on configuring this driver.

## Contributing

- Fork it ( <https://github.com/[my-github-username]/kitchen-hyperv/fork> )
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create a new Pull Request
