{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    #allowBroken = true;
  };
  environment.systemPackages = with pkgs; [
    btop
    curl
    # findutils
    htop
    git
    neovim
    python3
    tree
    vim 
    vntop
    wget

    #Gaming
    gamemode
    glxinfo
    lutris
    mesa
    protonup-qt
    steam
  ];
}