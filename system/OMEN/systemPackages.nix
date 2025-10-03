{ config, pkgs, ... }:

{
  imports = [ 
    ../applications/development/ccpp.nix
  ];
  environment.systemPackages = with pkgs; [
    #libsForQt5.ktorrent
    #ollama
    gitkraken

    #Programming
    ghc     #Haskell compiler
    go
    jdk8
    nodejs_24
    


    #Penetration Testing
    binwalk
    burpsuite
    exif
    exiftool
    #ghidra
    hashcat
    #thc-hydra
    nmap
    pdfcrack
    #wifite2
    wireshark-qt

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

  ];
}
