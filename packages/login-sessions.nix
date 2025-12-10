{
  mkAeroThemeDerivation,
  src,
  ...
}:
mkAeroThemeDerivation {
  pname = "atp-login-sessions";
  version = "0.0.1";

  inherit src;
  srcPath = "/plasma/sddm/login-sessions";
}
