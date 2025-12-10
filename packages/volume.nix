{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-volume";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/plasmoids/src/volume_src/";
}
