# Change Log

## [v0.5.4](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.5.4) (2019-05-06)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.5.3...v0.5.4)

- Added quotes around variable for Get-DefaultVMSwitch to prevent failures. Thanks @kdoores
- Misc readme updates
- Apply Chefstyle to the repo and setup Azure Devops Pipelines for CI
- Allow testing on newer versions of minitest
- Use the latest github_changelog_generator for releases
- Switch require to require_relative to speed up Ruby requires

## [v0.5.3](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.5.3) (2019-03-20)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.5.2...v0.5.3)

- Loosen the Test Kitchen dep to all 2.0 [\#72](https://github.com/test-kitchen/kitchen-hyperv/pull/72) ([tas50](https://github.com/tas50))
- Update set_vm_ipaddress_ps to wait for "ok" status [\#65](https://github.com/test-kitchen/kitchen-hyperv/pull/65) ([shawnj](https://github.com/shawnj))
- Disable automatic snaptshots [\#64](https://github.com/test-kitchen/kitchen-hyperv/pull/64) ([ebjornset](https://github.com/ebjornset))


## [v0.5.2](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.5.2) (2018-10-23)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.5.1...v0.5.2)

**Merged pull requests:**

- Trim dev deps from the gem and fix license [\#70](https://github.com/test-kitchen/kitchen-hyperv/pull/70) ([tas50](https://github.com/tas50))
- Updated readme - copy_vm_files requires guest services [\#66](https://github.com/test-kitchen/kitchen-hyperv/pull/66) ([aseverns](https://github.com/aseverns))
- Fix case sensitivity issue in require [\#67](https://github.com/test-kitchen/kitchen-hyperv/pull/67) ([ ddaymn ](https://github.com/ddaymn))

## [v0.5.1](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.5.1) (2017-09-08)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.5.0...v0.5.1)

**Merged pull requests:**

- Change resize\_vhd parameter to -SizeBytes [\#58](https://github.com/test-kitchen/kitchen-hyperv/pull/58) ([jdoores](https://github.com/jdoores))

## [v0.5.0](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.5.0) (2017-07-05)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.4.1...v0.5.0)

**Merged pull requests:**

- version bump and changelog for v0.5.0 [\#55](https://github.com/test-kitchen/kitchen-hyperv/pull/55) ([smurawski](https://github.com/smurawski))
- Fixed issue with existing stale diff disk [\#53](https://github.com/test-kitchen/kitchen-hyperv/pull/53) ([jdoores](https://github.com/jdoores))
- Added static\_mac\_address feature [\#52](https://github.com/test-kitchen/kitchen-hyperv/pull/52) ([jdoores](https://github.com/jdoores))

## [v0.4.1](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.4.1) (2017-03-29)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.4.0...v0.4.1)

**Merged pull requests:**

- Fix error when no additional disks [\#48](https://github.com/test-kitchen/kitchen-hyperv/pull/48) ([smurawski](https://github.com/smurawski))

## [v0.4.0](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.4.0) (2017-03-24)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.3.0...v0.4.0)

**Merged pull requests:**

- Feature/disable secureboot [\#44](https://github.com/test-kitchen/kitchen-hyperv/pull/44) ([smastrorocco](https://github.com/smastrorocco))
- Feature/additional disk [\#43](https://github.com/test-kitchen/kitchen-hyperv/pull/43) ([smastrorocco](https://github.com/smastrorocco))
- Feature/vlan support [\#41](https://github.com/test-kitchen/kitchen-hyperv/pull/41) ([smastrorocco](https://github.com/smastrorocco))
- Add ability to resize a the VHD when the disk is created [\#40](https://github.com/test-kitchen/kitchen-hyperv/pull/40) ([watsonlu](https://github.com/watsonlu))

## [v0.3.0](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.3.0) (2016-11-28)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.2.3...v0.3.0)

**Merged pull requests:**

- Support setting VM notes [\#39](https://github.com/test-kitchen/kitchen-hyperv/pull/39) ([watsonlu](https://github.com/watsonlu))
- Fix mounting iso on Gen 2 VM [\#38](https://github.com/test-kitchen/kitchen-hyperv/pull/38) ([mahsoud](https://github.com/mahsoud))
- Adding support for HyperV Guest Interface Services [\#34](https://github.com/test-kitchen/kitchen-hyperv/pull/34) ([gaelcolas](https://github.com/gaelcolas))
- Fix line continuation syntax [\#32](https://github.com/test-kitchen/kitchen-hyperv/pull/32) ([brantb](https://github.com/brantb))

## [v0.2.3](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.2.3) (2016-06-10)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.2.2...v0.2.3)

**Merged pull requests:**

- Support PowerShell v5.1 on the Insider Preview - updated [\#31](https://github.com/test-kitchen/kitchen-hyperv/pull/31) ([smurawski](https://github.com/smurawski))

## [v0.2.2](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.2.2) (2016-06-10)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.2.1...v0.2.2)

**Merged pull requests:**

- Support PowerShell v5.1 on the Insider Preview [\#30](https://github.com/test-kitchen/kitchen-hyperv/pull/30) ([smurawski](https://github.com/smurawski))

## [v0.2.1](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.2.1) (2016-05-25)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.20...v0.2.1)

## [v0.1.20](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.20) (2016-05-17)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.10...v0.1.20)

**Merged pull requests:**

- More Configurable VM Networking [\#27](https://github.com/test-kitchen/kitchen-hyperv/pull/27) ([svmastersamurai](https://github.com/svmastersamurai))
- Add -noprofile to powershell executions to prevent users' custom prof… [\#23](https://github.com/test-kitchen/kitchen-hyperv/pull/23) ([kriszentner](https://github.com/kriszentner))

## [v0.1.10](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.10) (2015-12-03)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.9...v0.1.10)

**Merged pull requests:**

- update incorrect module name [\#21](https://github.com/test-kitchen/kitchen-hyperv/pull/21) ([jbruettcva](https://github.com/jbruettcva))

## [v0.1.9](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.9) (2015-12-03)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.8...v0.1.9)

## [v0.1.8](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.8) (2015-12-03)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.7...v0.1.8)

**Merged pull requests:**

- Updating readme.md to include image configuration, specifically winrm… [\#20](https://github.com/test-kitchen/kitchen-hyperv/pull/20) ([jbruettcva](https://github.com/jbruettcva))
- Hyper-V module and Get-VMIP delay fix [\#19](https://github.com/test-kitchen/kitchen-hyperv/pull/19) ([jbruettcva](https://github.com/jbruettcva))
- File copy feature [\#17](https://github.com/test-kitchen/kitchen-hyperv/pull/17) ([dpiessens](https://github.com/dpiessens))
- Fixed NilClass exception if VM does not exist [\#16](https://github.com/test-kitchen/kitchen-hyperv/pull/16) ([dpiessens](https://github.com/dpiessens))
- Add support for dynamic memory [\#15](https://github.com/test-kitchen/kitchen-hyperv/pull/15) ([brantb](https://github.com/brantb))

## [v0.1.7](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.7) (2015-07-14)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.6...v0.1.7)

**Merged pull requests:**

- 64-bit windows support [\#8](https://github.com/test-kitchen/kitchen-hyperv/pull/8) ([ksubrama](https://github.com/ksubrama))

## [v0.1.6](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.6) (2015-06-25)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.5...v0.1.6)

## [v0.1.5](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.5) (2015-06-24)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.2...v0.1.5)

**Merged pull requests:**

- Adding support for mounting ISOs [\#6](https://github.com/test-kitchen/kitchen-hyperv/pull/6) ([smurawski](https://github.com/smurawski))

## [v0.1.2](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.2) (2015-05-20)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.1...v0.1.2)

**Merged pull requests:**

- Smurawski/updating metadata [\#4](https://github.com/test-kitchen/kitchen-hyperv/pull/4) ([smurawski](https://github.com/smurawski))

## [v0.1.1](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.1) (2015-05-20)
[Full Changelog](https://github.com/test-kitchen/kitchen-hyperv/compare/v0.1.0...v0.1.1)

## [v0.1.0](https://github.com/test-kitchen/kitchen-hyperv/tree/v0.1.0) (2015-05-20)
**Merged pull requests:**

- Prepping for release [\#3](https://github.com/test-kitchen/kitchen-hyperv/pull/3) ([smurawski](https://github.com/smurawski))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
