{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-desktopcontainment";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/plasmoids/src/desktopcontainment/";
}
