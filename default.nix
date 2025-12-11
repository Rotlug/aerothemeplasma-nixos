{
  lib,
  stdenv,
  kdePackages,
  cmake,
  ninja,
  fetchFromGitLab,
  xorg,
  pkg-config,
  callPackage,
  ...
}: let
  # Base source used by all packages
  baseSrc = fetchFromGitLab {
    domain = "gitgud.io";
    owner = "wackyideas";
    repo = "aerothemeplasma";
    rev = "97506fd35e3d186442e13b8d9021bd9b41c26c22";
    sha256 = "sha256-aeI5wiW9qXlSm/h5B21sRGCt2Azlit5WE5axeY8Sfew=";
  };

  # function that is used to compile effects and widgets that are build from source
  mkAeroThemeDerivation = lib.extendMkDerivation {
    constructDrv = stdenv.mkDerivation;

    extendDrvArgs = final: args @ {
      pname,
      version ? "0.0.1",
      src,
      srcPath ? "",
      nativeBuildInputs ? [],
      buildInputs ? [],
      ...
    }: let
      baseNative = [
        cmake
        ninja
        kdePackages.extra-cmake-modules
        kdePackages.wrapQtAppsHook
        pkg-config
      ];
      baseBuild = [
        # Core KDE/Qt dependencies
        kdePackages.qtbase
        kdePackages.kconfig
        kdePackages.kcoreaddons
        kdePackages.kwindowsystem
        kdePackages.qttools
        kdePackages.qtwayland

        # Common KWin effect dependencies
        kdePackages.kcmutils
        kdePackages.kdecoration
        kdePackages.qtdeclarative
        kdePackages.kconfigwidgets
        kdePackages.kcolorscheme
        kdePackages.kwayland
        kdePackages.kwin
        kdePackages.kwin-x11
        kdePackages.plasma5support

        # Additional common dependencies
        kdePackages.kguiaddons
        kdePackages.ki18n
        kdePackages.kiconthemes
        kdePackages.kirigami

        # System libraries
        xorg.libX11
      ];
    in
      args
      // {
        nativeBuildInputs = baseNative ++ nativeBuildInputs;
        buildInputs = baseBuild ++ buildInputs;

        inherit pname version src;

        cmakeFlags = [
          "-DKWIN_BUILD_WAYLAND=ON" # <-- Build with wayland
        ];

        postUnpack =
          if srcPath != ""
          then let
            cleanPath =
              if lib.hasPrefix "/" srcPath
              then lib.removePrefix "/" srcPath
              else srcPath;
          in ''
            if [ -d "$sourceRoot/${cleanPath}" ]; then
              # Create temp directory for subdirectory contents
              mkdir -p $TMPDIR/subdir-root
              # Copy all contents from subdirectory
              cp -r $sourceRoot/${cleanPath}/* $TMPDIR/subdir-root 2>/dev/null || true
              cp -r $sourceRoot/${cleanPath}/.[!.]* $TMPDIR/subdir-root 2>/dev/null || true
              # Remove everything from source root
              rm -rf $sourceRoot/*
              rm -rf $sourceRoot/.* 2>/dev/null || true
              # Move subdirectory contents to source root
              mv $TMPDIR/subdir-root/* $sourceRoot/ 2>/dev/null || true
              mv $TMPDIR/subdir-root/.[!.]* $sourceRoot/ 2>/dev/null || true
              rmdir $TMPDIR/subdir-root
            else
              echo "Error: Subdirectory ${cleanPath} not found in source root $sourceRoot"
              ls -la $sourceRoot
              exit 1
            fi
          ''
          else "";
      };
  };

  # Some packages depend on the output of `decorations` so
  # it's built here before everything else
  packages = let
    decoration = callPackage ./packages/decoration.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
  in {
    aeroglide = callPackage ./packages/aeroglide.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    aeroglassblur = callPackage ./packages/aeroglassblur.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    smodglow = callPackage ./packages/smodglow.nix {
      inherit mkAeroThemeDerivation decoration;
      src = baseSrc;
    };
    smodsnap-v2 = callPackage ./packages/smodsnap-v2.nix {
      inherit mkAeroThemeDerivation decoration;
      src = baseSrc;
    };
    startupfeedback = callPackage ./packages/startupfeedback.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    inherit decoration;
    aerothemeplasma-kcmloader = callPackage ./packages/aerothemeplasma-kcmloader.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    login-sessions = callPackage ./packages/login-sessions.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    seventasks = callPackage ./packages/seventasks.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    sevenstart = callPackage ./packages/seventasks.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    desktopcontainment = callPackage ./packages/desktopcontainment.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    volume = callPackage ./packages/volume.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    notifications = callPackage ./packages/notifications.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };
    systemtray = callPackage ./packages/systemtray.nix {
      inherit mkAeroThemeDerivation;
      src = baseSrc;
    };

    extra = callPackage ./packages/extra.nix {
      inherit stdenv;
      src = baseSrc;
    };
  };
in
  {
    inherit mkAeroThemeDerivation;
  }
  // packages
