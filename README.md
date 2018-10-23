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