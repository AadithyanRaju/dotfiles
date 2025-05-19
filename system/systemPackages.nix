{ config, pkgs, ... }:

{
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
    btop
    curl
    htop
    gnome-tweaks
    libsForQt5.ktorrent
    openvpn
    vim 
    wget

    #Git
    git
    gitkraken
    gh

    #Programming
    gcc
    ghc     #Haskell compiler
    gnumake
    go
    jq
    libgcc	
    nodejs_24
    (python3.withPackages (subpkgs: with subpkgs; [
        requests
    ]))

    #Penetration Testing
    binwalk
    nmap
    pdfcrack
    wireshark-qt

    #Utilities
    android-tools #adb
    anydesk       #Remote desktop
    findutils     #find
    flameshot
    inetutils     
    lsof          #List open files
    netcat-gnu	  #nc
    pciutils      #List PCI devices
    scrcpy        #Screen mirroring
    sticky        #Sticky notes
    tree          #List directory structure
    zoxide        #Jump around directories

    #Communication
    telegram-desktop
    discord

    #Browser
    google-chrome
    #opera

    #Editors
    neovim
    vscode

    #Office
    wpsoffice

    #Media
    ani-cli
    ffmpeg_6-full
    obs-studio
    vlc

    #ZIP
    unrar
    p7zip
    unzip
  ];
}
