{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-aerothemeplasma-kcmloader";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/aerothemeplasma-kcmloader";
}
