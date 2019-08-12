# Chocolatey Package for RSSOwlnix

A choco package for RSSOwlnix (https://github.com/Xyrio/RSSOwlnix)

## Packing and testing

Creating the package
```
$ choco pack
Chocolatey v0.10.11
Attempting to build package from 'rssowlnix.nuspec'.
Successfully created package 'C:\...\choco-rssowlnix\rssowlnix.2.6.1-beta.nupkg'
```

Installing
```
$ choco install -s . rssowlnix.2.6.1-beta.nupkg
```

Uninstalling
```
$ choco uninstall rssowlnix
```

## Updating a new version

Update package version at `rssowlnix.nuspec`.

Update download packages at `tools/chocolateyinstall.ps1`.

Download the installable packages from the release.

Get the checksum:
```
$ curl -L https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.1/RSSOwlnix-2-7-1-win32.win32.x86.zip --output RSSOwlnix-2-7-1-win32.win32.x86.zip
$ checksum -f ./RSSOwlnix-2-7-1-win32.win32.x86.zip -t sha256
11705250A773E8A73AF5E65E430258FE73C55C33DCB41C9214C32702EC65E2DD
$ curl -L -O https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.1/RSSOwlnix-2-7-1-win32.win32.x86_64.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   629    0   629    0     0    936      0 --:--:-- --:--:-- --:--:--   936
100 40.3M  100 40.3M    0     0  3861k      0  0:00:10  0:00:10 --:--:-- 9417k
$ checksum -f ./RSSOwlnix-2-7-1-win32.win32.x86_64.zip -t sha256
B316520D12A71185A1077D8E2C8FD2737CB789F26557CCF6AEEC3322C63293B1
```

Update checksums at `tools/chocolateyinstall.ps1`.

Create the package:
```
$ choco pack
Chocolatey v0.10.11
Attempting to build package from 'rssowlnix.nuspec'.
Successfully created package 'C:\...\choco-rssowlnix\rssowlnix.2.7.1-beta.nupkg'
```

Publishing
```
$ choco apikey -k [API_KEY_HERE] -source https://push.chocolatey.org/
$ choco push rssowlnix.2.7.1-beta.nupkg -s https://push.chocolatey.org/
```
