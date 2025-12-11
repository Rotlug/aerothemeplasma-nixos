# AeroThemePlasma for NixOS

**(Still doesn't work)** This is an attempt to package the [AeroThemePlasma](https://gitgud.io/wackyideas/aerothemeplasma/) theme for Nix/NixOS.

## What still needs to be done
* `extras` package needs to extract the icons, cursor and sound themes (which are `.tar.gz`) instead of just copying them

* Package `desktopcontainment` widget

* Add metadata to packages

## How to Install
You can try out the current state of the package by writing something like this in your NixOS config:

```nix
{pkgs, ...}: let
  aerothemeplasma = pkgs.callPackage path/to/aero {};
in {
  environment.systemPackages = with aerothemeplasma;
    [
      extra
      aeroglassblur
      aeroglide
      decoration
      login-sessions
      smodglow
      smodsnap-v2
      startupfeedback

      notifications
      systemtray
      sevenstart
      seventasks
      volume
    ]
    ++ (with pkgs; [
      kdePackages.qtstyleplugin-kvantum
    ]);
}
```
