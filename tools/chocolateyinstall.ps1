$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.0/RSSOwlnix-2-7-0-win32.win32.x86.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.0/RSSOwlnix-2-7-0-win32.win32.x86_64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'RSSOwlnix*'

  checksum      = 'B32F3874D448F3D1EC758649DDFAD284BF6C9E9CDD554D45EA0CAAB1D4F9FED6'
  checksumType  = 'sha256' 
  checksum64    = 'EC68294C7ED8A753155E71B30411C6128051AE47DB3A61F7B74B94C66E1DDE91'
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
