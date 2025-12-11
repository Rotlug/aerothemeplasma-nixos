{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-kcmloader";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/aerothemeplasma-kcmloader";
}
