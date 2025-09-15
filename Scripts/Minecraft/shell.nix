{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.openjdk
    pkgs.wget
    pkgs.unzip

    # Needed X11 libs for AWT/Swing
    pkgs.xorg.libX11
    pkgs.xorg.libXext
    pkgs.xorg.libXtst
    pkgs.xorg.libXi
    pkgs.xorg.libXrender
    pkgs.xorg.libXrandr
    pkgs.xorg.libXcursor
    pkgs.xorg.libXinerama
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
}
