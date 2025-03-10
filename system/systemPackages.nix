{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    #allowBroken = true;
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
    nodejs_23 
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
    findutils     #find
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
  ];
}