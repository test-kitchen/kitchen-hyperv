# Contributing to kitchen-hyperv

Thanks for your interest in improving kitchen-hyperv. Bug reports, feature requests, and pull requests are all welcome.

## Reporting issues

Report bugs and request features on the [issue tracker](https://github.com/test-kitchen/kitchen-hyperv/issues). For bugs, please include:

- the version of kitchen-hyperv and Test Kitchen you are using
- your Windows and Hyper-V version
- your `kitchen.yml` with credentials removed
- the output of the failing command, ideally with `-l debug`

Setting `dry_run: true` on the driver makes it echo the PowerShell it would run
instead of running it, which is often the fastest way to show what went wrong.

## Development setup

Clone the repository and install the dependencies:

```sh
git clone https://github.com/test-kitchen/kitchen-hyperv.git
cd kitchen-hyperv
bundle install
```

## Running the tests

Run the unit tests and the style check together:

```sh
bundle exec rake
```

Run them individually:

```sh
bundle exec rake test     # unit tests (spec/**/*_spec.rb)
bundle exec rake quality  # Cookstyle / RuboCop
```

`rake test` is an alias for `rake unit`, and `rake quality` for `rake style`.
YARD documentation can be generated with `bundle exec rake yard`.

Many style offenses can be corrected automatically:

```sh
bundle exec cookstyle -a
```

The unit tests stub out PowerShell execution, so they run on any platform and
do not need Hyper-V or an elevated shell.

### Manual testing against Hyper-V

Changes that touch VM creation should also be exercised on a real Hyper-V host,
since the unit tests cannot catch PowerShell or Hyper-V API regressions. You
will need:

- an elevated shell, as the Hyper-V cmdlets require administrator rights
- a parent VHD or VHDX to clone from

Point a `kitchen.yml` at that parent disk and run `kitchen test`. Afterwards,
confirm with `Get-VM` that no test VMs are left behind and that the
differencing disks were removed.

## Submitting changes

1. Fork the repository.
2. Create a feature branch off `main`.
3. Make your change, adding or updating tests to cover it.
4. Make sure `bundle exec rake` passes.
5. Push the branch to your fork and open a pull request.

Please keep pull requests focused on a single change — it makes review much
faster. Update the documentation in `README.md` when you add or change a
configuration option.

## Release process

Releases are handled by the maintainers.

1. Update `lib/kitchen/driver/hyperv_version.rb` with the new version.
2. Update `CHANGELOG.md`.
3. Merge to `main`; the [publish workflow](.github/workflows/publish.yml) builds
   the gem and pushes it to RubyGems.

`bundle exec rake changelog` regenerates `CHANGELOG.md` from merged pull
requests via github_changelog_generator.
