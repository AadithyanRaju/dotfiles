{ config, pkgs, ... }:

{
  imports = [
  ];
  
  home = {
    username = "aadithyan";
    homeDirectory = "/home/aadithyan";
    stateVersion = "23.11"; 
  };
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;


  #home.file = {
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  #  ".zshrc".source = ./term/zshrc;
  #};


  home.sessionVariables = {
    
  };


  #programs = {
  #  zsh = {
  #    enable = true;
  #  };
  #  bash = {
  #    enable = true;
  #    initExtra = ". /home/aadithyan/.dotfiles/term/mycom";
  #  };
  #};

  home.packages = with pkgs; [
      # libsForQt5.ktorrent
      # multimarkdown
      # wpsoffice 
      #Communication
      #telegram-desktop


      #Development
      #gcc
      #gh
      #ghc
      #gnumake
      #libgcc			
      #python3

      #Media
      #vlc		


      #RPC
      #findutils
      #libnsl
      #libtirpc
      #ntirpc
      #rpcsvc-proto
      #rpcbind

      #Tools
      #appimage-run	#appimage
      #android-tools
      #alacritty
      binwalk			
      #inetutils
      #netcat-gnu	#nc
      #nmap
      # wireshark-qt	#WireShark
      #scrcpy
      sticky
      #btop
      #xfce.xfce4-settings
      #networkmanagerapplet
      #Enjoy
      #ani-cli
      #vlc

  ];

  

}
