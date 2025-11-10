{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #libsForQt5.ktorrent
    #ollama

    
    #Utilities
    anydesk       #Remote desktop
    flameshot
    openvpn
    scrcpy        #Screen mirroring
    sticky        #Sticky notes
    


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
