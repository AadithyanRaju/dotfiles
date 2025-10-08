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
    #Git
    git
    gh

    #Utilities
    android-tools #adb
    btop
    curl
    findutils     #find
    gallery-dl
    gparted
    htop
    inetutils     
    jq
    lsof          #List open files
    netcat-gnu	  #nc
    nix-index
    pciutils      #List PCI devices
    tree          #List directory structure
    wget
    zoxide        #Jump around directories

    #Communication
    telegram-desktop
    discord

    #Media
    ffmpeg_6-full
    vlc

    #ZIP
    unrar
    p7zip
    unzip

    #Other Apps
    #android-studio
    #ciscoPacketTracer8
    gnome-tweaks
    nautilus
    xfce.thunar
    ranger

    #USB
    libusb1
  ];

}