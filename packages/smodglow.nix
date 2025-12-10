{
  mkAeroThemeDerivation,
  src,
  decoration,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-smodglow";
  version = "0.0.1";

  inherit src;

  srcPath = "/kwin/effects_cpp/smodglow";

  buildInputs = [decoration];
}
