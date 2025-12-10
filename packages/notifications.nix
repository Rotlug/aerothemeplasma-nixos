{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-notifications";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/plasmoids/src/notifications_src/";
}
