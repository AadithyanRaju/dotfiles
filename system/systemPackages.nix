{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ./overlays/pygame-avx2.nix)
  ];
  nixpkgs.config = {
    allowUnfree = true;
    #allowBroken = true;
    allowUnfreePredicate = pkg: builtins.elem (builtins.parseDrvName pkg.name).name ["steam"];
    permittedInsecurePackages = [
      "openssl-1.1.1v"
      "python-2.7.18.7"
    ];

  };
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    libsForQt5.ktorrent
    ollama

    #Git
    git
    gitkraken
    gh

    #Programming
    ## C/C++
    libgcc	
    gcc
    gnumake
    cmake
    extra-cmake-modules
    ghc     #Haskell compiler
    go
    jq
    jdk8
    nodejs_24
    (python3.withPackages (ps: with ps; let
      pygame-avx2 = ps.pygame.overrideAttrs (oldAttrs: {
        buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.pkg-config ];
        preBuild = ''
          export PYGAME_DETECT_AVX2=1
        '';
      });
    in [
      requests
      numpy
      matplotlib
      opencv4
      pandas
      pygame-avx2
    ]))


    #Penetration Testing
    binwalk
    burpsuite
    exif
    exiftool
    ghidra
    hashcat
    thc-hydra
    nmap
    pdfcrack
    wireshark-qt

    #Utilities
    android-tools #adb
    anydesk       #Remote desktop
    btop
    curl
    findutils     #find
    flameshot
    gallery-dl
    htop
    inetutils     
    lsof          #List open files
    netcat-gnu	  #nc
    nix-index
    openvpn
    pciutils      #List PCI devices
    scrcpy        #Screen mirroring
    sticky        #Sticky notes
    tree          #List directory structure
    wget
    zoxide        #Jump around directories

    #Communication
    telegram-desktop
    discord

    #Browser
    google-chrome
    #opera

    #Editors
    neovim
    vim 
    vscode

    #Office
    wpsoffice

    #Media
    ani-cli
    audacity
    ffmpeg_6-full
    loupe
    obs-studio
    vlc

    #ZIP
    unrar
    p7zip
    unzip

    #Other Apps
    #ciscoPacketTracer8
    nautilus
  ];
}
