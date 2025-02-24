{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
      # libsForQt5.ktorrent
      multimarkdown
      
      #Development
      gcc
      gh
      #ghc
      gnumake
      #libgcc			
      python3

      #Media


      #RPC
      #findutils
      #libnsl
      #libtirpc
      #ntirpc
      #rpcsvc-proto
      #rpcbind

      #Tools
      appimage-run	#appimage
      #android-tools
      #alacritty
      binwalk			
      #inetutils
      netcat-gnu	#nc
      nmap
      #wireshark-qt	#WireShark
      scrcpy
      sticky
      #x2goclient
      #xfce.xfce4-settings
      #networkmanagerapplet
      
      #Enjoy
      ani-cli
 
  ];
}