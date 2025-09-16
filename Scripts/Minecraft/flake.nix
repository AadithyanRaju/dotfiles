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
          jdk21      # Java runtime
          libx11
          libxext
          libxrender
          xorg.libXi
          libxrandr
          fontconfig
          freetype
          zlib
        ];

        shellHook = ''
          export _JAVA_AWT_WM_NONREPARENTING=1
          export GDK_BACKEND=x11
          echo " TLauncher devShell ready. Run with:"
          echo "    java -jar /path/to/TLauncher.jar"
        '';
      };
    };
}
