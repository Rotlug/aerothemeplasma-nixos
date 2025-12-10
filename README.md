# AeroThemePlasma for NixOS

**(Still doesn't work)** This is an attempt to package the [AeroThemePlasma](https://gitgud.io/wackyideas/aerothemeplasma/) theme for Nix/NixOS.

## What needs to be done

* Currently, SevenTasks is broken because it depends on a patched version of libplasma since ~plasma 6.4, I've reached the limit of my nix knowledge so any help is welcome!

* `extras` package needs to extract the icons, cursor and sound themes (which are `.tar.gz`) instead of just copying them

* Need to copy kvantum theme to the right place

* Add metadata to packages
