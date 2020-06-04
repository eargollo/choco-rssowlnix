$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.8.0/RSSOwlnix-2-8-0-win32.win32.x86.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.8.0/RSSOwlnix-2-8-0-win32.win32.x86_64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'RSSOwlnix*'

  checksum      = '2667FFFA88D2DB996B71893595A9FFB10A5321D85BAF9FF46BAAA708A46BC830'
  checksumType  = 'sha256' 
  checksum64    = '791DDA169C9C640F8D2E00539F1DC9326C1347AC91A6448B38AB683DAA8481B2'
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
