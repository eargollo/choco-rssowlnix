$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.9.0/RSSOwlnix-2-9-0-win32.win32.x86.zip'
$url64      = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.9.0/RSSOwlnix-2-9-0-win32.win32.x86_64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'RSSOwlnix*'

  checksum      = '1C9CFBE6227FD05C6A1627EB1173A07030DF4BF95A39C63A6DCE587945AACAE6'
  checksumType  = 'sha256' 
  checksum64    = 'AD845AA2CDF730A1767E4A21B058D697F82D51FB5DFCCA2162BFC9AD171D0824'
  checksumType64= 'sha256' 

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

# Add shortcut to the desktop
Install-ChocolateyShortcut `
  -ShortcutFilePath "$env:USERPROFILE\Desktop\RSSOwlnix.lnk" `
  -TargetPath "$toolsDir\RSSOwlnix\RSSOwlnix.exe" `
  -Description 'RSSOwlnix'

#install start menu shortcut
$linkName = "RSSOwlnix.lnk"
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath "$toolsDir\RSSOwlnix\RSSOwlnix.exe"
