{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
      #multimarkdown

      direnv
      #RPC
      #libnsl
      #libtirpc
      #ntirpc
      #rpcsvc-proto
      #rpcbind

      #Tools
      #
      #alacritty
      
      #x2goclient
      #xfce.xfce4-settings
      #networkmanagerapplet
      
 
  ];
}