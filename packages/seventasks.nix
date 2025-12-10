{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-seventasks";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/plasmoids/src/seventasks_src/";
}
