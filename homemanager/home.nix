{ config, pkgs, userSettings, ... }:

{
  imports = [
    ./candyIcons.nix
    ./fileManagement.nix
    ./git.nix
    ./packages.nix
    ./services.nix
    ./xdgPortal.nix
  ];
  
  home = {
    username = userSettings.username;
    homeDirectory = userSettings.userHome;
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;

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


}

