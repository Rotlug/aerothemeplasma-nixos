final: prev: {
  kdePackages = prev.kdePackages.overrideScope (final': prev': {
    libplasma = prev'.libplasma.overrideAttrs (oldAttrs: let
      # Fetch the aerothemeplasma source to get the libplasma patches
      baseSrc = final.fetchFromGitLab {
        domain = "gitgud.io";
        owner = "wackyideas";
        repo = "aerothemeplasma";
        rev = "97506fd35e3d186442e13b8d9021bd9b41c26c22";
        sha256 = "sha256-aeI5wiW9qXlSm/h5B21sRGCt2Azlit5WE5axeY8Sfew=";
      };
    in {
      # Add postUnpack phase to copy files from baseSrc/misc/libplasma
      postUnpack = (oldAttrs.postUnpack or "") + ''
        # Copy files from misc/libplasma into the libplasma source
        if [ -d "${baseSrc}/misc/libplasma" ]; then
          echo "Applying libplasma patches from aerothemeplasma..."
          cp -r "${baseSrc}/misc/libplasma"/* "$sourceRoot/" 2>/dev/null || true
          cp -r "${baseSrc}/misc/libplasma"/.[!.]* "$sourceRoot/" 2>/dev/null || true
          echo "libplasma patches applied successfully"
        else
          echo "Warning: misc/libplasma directory not found in aerothemeplasma source"
          ls -la "${baseSrc}/misc/" || true
        fi
      '';
    });
  });
}
