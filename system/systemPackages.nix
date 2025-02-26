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
    openvpn
    python3
    tree
    vim 
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