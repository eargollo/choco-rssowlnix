$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.6.1/RSSOwlnix-2-6-1-win32.win32.x86.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/Xyrio/RSSOwlnix/releases/download/2.6.1/RSSOwlnix-2-6-1-win32.win32.x86_64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'RSSOwlnix*'

  checksum      = '3E28B9A5AA67FC556905795B505955ED98503D4A84FD4971E4C031F880AF13CF'
  checksumType  = 'sha256' 
  checksum64    = '61FABCBEE56645558E176D0426C46DFA1D1FF400630A34C6737F94ACFBCEF876'
  checksumType64= 'sha256' 

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs
