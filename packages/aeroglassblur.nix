{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-aeroglassblur";
  version = "0.0.1";

  inherit src;
  srcPath = "/kwin/effects_cpp/kde-effects-aeroglassblur";
}
