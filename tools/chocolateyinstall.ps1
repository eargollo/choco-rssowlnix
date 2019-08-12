$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.1/RSSOwlnix-2-7-1-win32.win32.x86.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.1/RSSOwlnix-2-7-1-win32.win32.x86_64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'RSSOwlnix*'

  checksum      = '11705250A773E8A73AF5E65E430258FE73C55C33DCB41C9214C32702EC65E2DD'
  checksumType  = 'sha256' 
  checksum64    = 'B316520D12A71185A1077D8E2C8FD2737CB789F26557CCF6AEEC3322C63293B1'
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
