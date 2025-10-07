{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #libsForQt5.ktorrent
    #ollama
    gitkraken

    #Programming
    ghc     #Haskell compiler
    go
    jdk8
    nodejs_24
    
    #Utilities
    anydesk       #Remote desktop
    flameshot
    openvpn
    scrcpy        #Screen mirroring
    sticky        #Sticky notes
    

    #Browser
    google-chrome
    #opera

    #Office
    wpsoffice

    #Media
    ani-cli
    audacity
    loupe
    obs-studio
    spotify
    totem

    #Other Apps
    zed-editor

  ];
}
