{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-systemtray";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/plasmoids/src/systemtray_src/";
}
