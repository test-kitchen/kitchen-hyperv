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

The `integration` bundle group pulls in Berkshelf, Vagrant and Dokken, which are
only needed to drive a real VM. Skip them if you are just running the tests:

```sh
bundle config set --local without integration
bundle install
```

## Running the tests

There are two suites: RSpec for the Ruby driver, and Pester for the PowerShell
in `support/hyperv.ps1`. Both run on any platform -- neither needs Hyper-V, a
Windows host, or an elevated shell.

Run the unit tests and the style check together:

```sh
bundle exec rake
```

Run them individually:

```sh
bundle exec rake spec     # RSpec unit tests (spec/**/*_spec.rb)
bundle exec rake quality  # Cookstyle / RuboCop
bundle exec rake pester   # Pester tests for support/hyperv.ps1
```

`rake test` and `rake unit` are both aliases for `rake spec`, and `rake quality`
for `rake style`. `rake pester` is deliberately not part of `rake default`,
since it needs PowerShell 7+ on PATH.

Many style offenses can be corrected automatically:

```sh
bundle exec cookstyle -a
```

### How the RSpec suite is built

The driver's job is turning configuration into PowerShell and running it in the
right order, so the specs fake only the outermost boundary -- the Train
connection -- in `spec/support/fake_train_connection.rb`. Everything above it
runs for real, which means each command travels the genuine
`run_ps` -> `wrap_command` -> `encode_command` path. The fake decodes the
`-encodedcommand` payload back to readable PowerShell, so a spec can assert on
the script that would actually have reached the host:

```ruby
driver.create(state)

expect(connection.scripts_matching(/New-KitchenVM/).first)
  .to include(%{SwitchName = "Default Switch"})
```

Prefer that over stubbing `run_ps`: stubbing it asserts that the driver called a
mock, not that it generated the right PowerShell.

### The Pester suite

`spec/powershell/` holds the Pester tests, a stub Hyper-V module supplying the
cmdlet signatures off Windows, and `TestHelper.ps1`, which loads
`support/hyperv.ps1` with mockable shims in place. Requires Pester 5 or newer:

```sh
pwsh -c "Install-Module Pester -Scope CurrentUser -Force -SkipPublisherCheck"
```

Three Pester 5 rules matter when adding tests, because breaking any of them
produces tests that pass no matter what the code does:

- Dot-source `TestHelper.ps1` in each `Describe`'s `BeforeAll`, not once at file
  level. A function resolves its callees in the scope it was defined in.
- Call the function under test inside the `It`. `Should -Invoke` defaults to
  `-Scope It` and counts only invocations from the same `It` block.
- Use `-Exactly` on every "was not called" assertion. `-Times 0` on its own
  means "at least zero" and can never fail.

### Documentation

The public API carries YARD documentation:

```sh
bundle exec rake yard        # generate into doc/
bundle exec rake yard:stats  # coverage, listing anything undocumented
bundle exec rake yard:server # browse at http://localhost:8808
```

Documentation coverage deliberately does not gate the build -- `rake yard` is
not a prerequisite of `rake default`.

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

`CHANGELOG.md` is generated by release-please from conventional commit
messages; there is no rake task for it.
