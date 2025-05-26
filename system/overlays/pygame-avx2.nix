self: super:

let
  pythonPackages = super.python311Packages; # or python3Packages if you're defaulting to 3.11
in {
  python311Packages = pythonPackages // {
    pygame = pythonPackages.pygame.overrideAttrs (oldAttrs: {
      buildInputs = (oldAttrs.buildInputs or []) ++ [ super.pkg-config ];
      preBuild = ''
        export PYGAME_DETECT_AVX2=1
      '';
    });
  };
}
