{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-startupfeedback";
  version = "0.0.1";

  inherit src;
  srcPath = "/kwin/effects_cpp/startupfeedback";
}
