{
  mkAeroThemeDerivation,
  src,
  decoration,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-smodsnap-v2";
  version = "0.0.1";

  inherit src;
  srcPath = "/kwin/effects_cpp/kwin-effect-smodsnap-v2";

  buildInputs = [decoration];
}
