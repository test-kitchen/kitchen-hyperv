bundle exec rake unit && bundle exec rake quality

powershell -noprofile -nologo -command install-module -Name Pester -AllowClobber -Force -SkipPublisherCheck -scope CurrentUser; invoke-pester ./spec
