{
  description = "DevShell for running TLauncher on NixOS (fixed FHS version)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config = { allowUnfree = true; }; };
    in
    {
      devShells.${system}.default = pkgs.buildFHSEnv {
        name = "tlauncher-env";
        targetPkgs = pkgs: with pkgs; [
          jdk21
          mesa
          libGL
          libGLU
          xorg.libX11
          xorg.libXext
          xorg.libXrender
          xorg.libXi
          xorg.libXtst
          xorg.libXrandr
          fontconfig
          freetype
          zlib
          gtk3
          alsa-lib
          openal
          curl
          wget
          unzip
          steam-run
        ];

        runScript = "bash";

        profile = ''
          export _JAVA_AWT_WM_NONREPARENTING=1
          export GDK_BACKEND=x11
          echo ""
          echo "✅ TLauncher FHS shell ready!"
          echo "Run with:"
          echo "    java -jar /path/to/TLauncher.jar"
          echo "steam-run --run 'steam-run java -jar TLauncher.jar'"
          echo ""
        '';
      };
    };
}
