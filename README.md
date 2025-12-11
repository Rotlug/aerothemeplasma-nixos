# AeroThemePlasma for NixOS

This is an attempt to package the [AeroThemePlasma](https://gitgud.io/wackyideas/aerothemeplasma/) theme for Nix/NixOS.

## What still needs to be done
* Package `desktopcontainment` widget

* Add metadata to packages

## How to Install
You can try out the current state of the package by writing something like this in your NixOS config:

```nix
{pkgs, ...}: let
  aero = pkgs.callPackage ../../pkgs/aerothemeplasma {};
in {
  environment.systemPackages = with aero;
    [
      aeroglassblur
      aeroglide
      decoration
      kcmloader
      login-sessions
      smodglow
      smodsnap-v2
      startupfeedback
      sevenstart
      seventasks
      systemtray
      volume
      notifications
      extra
    ]
    ++ (with pkgs; [
      kdePackages.qtstyleplugin-kvantum
    ]);
}
```
