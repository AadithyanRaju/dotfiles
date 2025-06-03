{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./fileManagement.nix
  ];
  
  home = {
    username = "aadithyan";
    homeDirectory = "/home/aadithyan";
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

