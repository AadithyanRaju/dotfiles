{
  description = "DevShell for running TLauncher on NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          jdk21
          xorg.libX11
          xorg.libXext
          xorg.libXrender
          xorg.libXi
          xorg.libXtst
          libxrandr
          fontconfig
          freetype
          zlib
          gtk3
          alsa-lib
          openal
        ];

        shellHook = ''
          export _JAVA_AWT_WM_NONREPARENTING=1
          export GDK_BACKEND=x11
          echo ""
          echo "✅ TLauncher devShell ready!"
          echo "Run it with:"
          echo "    java -jar /path/to/TLauncher.jar"
          echo ""
        '';
      };
    };
}
