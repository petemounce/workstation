$ErrorActionPreference = "Stop"

Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0"

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install --yes `
  dropbox `
  googlechrome

write-output "MANUAL: sign in to dropbox and allow it to sync"
read-host "press something to continue other installs"
choco install -y `
  7zip `
  adb `
  autohotkey `
  cmder `
  curl `
  discord `
  dotnetcore `
  dotnetcore-sdk `
  firefox `
  git `
  golang `
  notepad2-mod `
  posh-github `
  protonvpn `
  spotify `
  steam `
  sysinternals `
  vlc `
  vscode `
  windirstat
install-module "posh-git" -force
Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
curl.exe -L -o "ubuntu-1804.appx" "https://aka.ms/wsl-ubuntu-1804"
Add-AppxPackage ./ubuntu-1804.appx

read-host "press something if dropbox has finished syncing"
Move-Item "c:\tools\cmder\config" "c:\tools\config-original-install"
cmd /c mklink /d "c:\tools\cmder\config" "$($env:USERPROFILE)\Dropbox\profiles\windows\cmder-config"
cmd /c mklink "$($env:USERPROFILE)\.gitconfig" "$($env:USERPROFILE)\Dropbox\profiles\git\personal\windows.gitconfig"
cmd /c mklink /d "$($env:USERPROFILE)\.ssh" "$($env:USERPROFILE)\Dropbox\profiles\dot-ssh\"
cmd /c mklink "$($env:USERPROFILE)\.ssh\config" "$($env:USERPROFILE)\Dropbox\profiles\dot-ssh\windows-config"
cmd /c mklink /d "$($env:USERPROFILE)\.aws" "$($env:USERPROFILE)\Dropbox\profiles\dot-aws\"
cmd /c mklink "$($env:USERPROFILE)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "$($env:USERPROFILE)\Dropbox\profiles\windows\profile.ps1"

mkdir "$($env:USERPROFILE)\bin"
curl.exe -o "$($env:USERPROFILE)\bin\direnv.exe" "https://github.com/direnv/direnv/releases/download/v2.21.2/direnv.windows-amd64.exe"

write-output "MANUAL: disable windows sounds"
write-output "MANUAL: shorten keyboard repeat delay"
write-output "MANUAL: sign in to chrome"
write-output "MANUAL: sign in to steam"
write-output "MANUAL: sign in to spotify"


mkdir "$($env:USERPROFILE)\src"
mkdir "$($env:USERPROFILE)\.secrets"
(Get-Item "$($env:USERPROFILE)\.secrets").Encrypt()
read-host "MANUAL: set up .secrets directory contents"
