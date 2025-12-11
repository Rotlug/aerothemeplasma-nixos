{
  lib,
  stdenv,
  src,
  ...
}:
stdenv.mkDerivation {
  pname = "atp-extra";
  version = "0.0.1";

  dontBuild = true;

  inherit src;

  patches = [
    ../patches/normal-libplasma.patch
  ];

  installPhase = ''
    mkdir -p $out/share/{plasma,sddm,kwin,icons,sounds,Kvantum,color-schemes}

    # Plasma components
    cd plasma
    cp -a desktoptheme        $out/share/plasma/
    cp -a look-and-feel       $out/share/plasma/
    cp -a plasmoids           $out/share/plasma/
    cp -a layout-templates    $out/share/plasma/
    cp -a shells              $out/share/plasma/
    cp -r color_scheme/* $out/share/color-schemes

    # SDDM theme
    cp -a sddm/sddm-theme-mod                $out/share/sddm/themes/

    cd ../kwin
    # KWin resources
    cp -a smod                $out/share/
    cp -a effects             $out/share/kwin/
    cp -a scripts             $out/share/kwin/
    cp -a outline             $out/share/kwin/
    cp -a tabbox              $out/share/kwin/

    cd ../misc

    # Kvantum theme
    if [ -d kvantum ]; then
      cp -a kvantum/* $out/share/
    fi

    # extract Windows 7 Aero.tar.gz
    if [ -f "icons/Windows 7 Aero.tar.gz" ]; then
      tar -xzf "icons/Windows 7 Aero.tar.gz" -C "$out/share/icons/"
    fi

    # extract aero-drop.tar.gz
    if [ -f "cursors/aero-drop.tar.gz" ]; then
      tar -xzf "cursors/aero-drop.tar.gz" -C "$out/share/icons/"
    fi

    # extract sounds.tar.gz
    if [ -f "sounds/sounds.tar.gz" ]; then
      tar -xzf "sounds/sounds.tar.gz" -C "$out/share/sounds/"
    fi

    # Mimetype packages
    if [ -d mimetype ]; then
      cp -a mimetype $out/share/
    fi
  '';

  meta = with lib; {
    description = "AeroThemePlasma – assets-only package (plasmoids, themes, icons, SDDM theme, kvantum, etc.)";
    platforms = platforms.linux;
  };
}
