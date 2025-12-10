{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-decoration";
  version = "0.0.1";

  inherit src;
  srcPath = "/kwin/decoration";
}
