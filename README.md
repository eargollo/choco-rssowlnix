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
$ curl https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.0/RSSOwlnix-2-7-0-win32.win32.x86.zip --output RSSOwlnix-2-7-0-win32.win32.x86.zip
$ checksum -f ./RSSOwlnix-2-7-0-win32.win32.x86.zip -t sha256
B32F3874D448F3D1EC758649DDFAD284BF6C9E9CDD554D45EA0CAAB1D4F9FED6
$ curl -L -O https://github.com/Xyrio/RSSOwlnix/releases/download/2.7.0/RSSOwlnix-2-7-0-win32.win32.x86_64.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   629    0   629    0     0    936      0 --:--:-- --:--:-- --:--:--   936
100 40.3M  100 40.3M    0     0  3861k      0  0:00:10  0:00:10 --:--:-- 9417k
$ checksum -f ./RSSOwlnix-2-7-0-win32.win32.x86_64.zip -t sha256
EC68294C7ED8A753155E71B30411C6128051AE47DB3A61F7B74B94C66E1DDE91
```

Update checksum at `tools/chocolateyinstall.ps1`.

Create the package:
Creating the package
```
$ choco pack
Chocolatey v0.10.11
Attempting to build package from 'rssowlnix.nuspec'.
Successfully created package 'C:\...\choco-rssowlnix\rssowlnix.2.6.1-beta.nupkg'
```

