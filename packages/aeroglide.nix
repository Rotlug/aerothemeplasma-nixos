{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-aeroglide";
  version = "0.0.1";

  inherit src;
  srcPath = "/kwin/effects_cpp/aeroglide";
}
