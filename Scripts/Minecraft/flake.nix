{
  description = "TLauncher devShell for NixOS + Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.openjdk

          # X11 dependencies for Java AWT/Swing
          pkgs.xorg.libX11
          pkgs.xorg.libXext
          pkgs.xorg.libXtst
          pkgs.xorg.libXi
          pkgs.xorg.libXrender
          pkgs.xorg.libXrandr
          pkgs.xorg.libXcursor
          pkgs.xorg.libXinerama

          # Fonts + GTK for Java GUI rendering
          pkgs.freetype
          pkgs.fontconfig
          pkgs.gtk3
          pkgs.glib
        ];

        shellHook = ''
          if [ -f TLauncher.jar ]; then
              echo "Running TLauncher with system JDK..."
              JAVA_HOME=${pkgs.openjdk}
              PATH=$JAVA_HOME/bin:$PATH
              exec java -jar TLauncher.jar
          else
              echo "TLauncher.jar not found in current directory."
          fi
          exit
        '';
      };
    };
}
