@echo off
REM Unit tests (RSpec) and style checks. These need no Hyper-V host.
bundle exec rake test || exit /b 1
bundle exec rake quality || exit /b 1

REM PowerShell tests (Pester 5+) for support/hyperv.ps1.
powershell -noprofile -nologo -command "if (-not (Get-Module -ListAvailable Pester | Where-Object Version -ge '5.0.0')) { Install-Module -Name Pester -MinimumVersion 5.0 -AllowClobber -Force -SkipPublisherCheck -Scope CurrentUser }" || exit /b 1
bundle exec rake pester || exit /b 1
