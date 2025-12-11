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
    mkdir -p $out/share/{plasma,sddm,kwin,icons,sounds,Kvantum}

    # Plasma components
    cd plasma
    cp -a desktoptheme        $out/share/plasma/
    cp -a look-and-feel       $out/share/plasma/
    cp -a plasmoids           $out/share/plasma/

    cp -a layout-templates    $out/share/plasma/
    cp -a shells              $out/share/plasma/

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

    # Icons, cursors, sounds
    # TODO: Actually extract the files instead of
    # just copying them
    [ -d icons   ] && cp -a icons/*   $out/share/icons/
    [ -d cursors ] && cp -a cursors/* $out/share/icons/
    [ -d sounds  ] && cp -a sounds/*  $out/share/sounds/

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
