self: super:

let
  pythonPackages = super.python311Packages;
in {
  python311Packages = pythonPackages // {
    pygame = pythonPackages.pygame.overrideAttrs (old: {
      patches = (old.patches or []) ++ [ ./pygame-distutils-spawn-fix.patch ];
      buildInputs = (old.buildInputs or []) ++ [ super.pkg-config ];
      preBuild = ''
        export PYGAME_DETECT_AVX2=1
      '';
    });
  };
}
