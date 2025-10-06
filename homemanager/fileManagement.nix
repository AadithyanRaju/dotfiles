{ config, pkgs, lib, userSettings, ... }:

{
  home.activation.dotfileLinks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p $HOME/.config
    ln -snf ${userSettings.dotfilesDir}/term/zshrc $HOME/.zshrc
    ln -snf ${userSettings.dotfilesDir}/config/hypr $HOME/.config/hypr
    ln -snf ${userSettings.dotfilesDir}/config/waybar $HOME/.config/waybar
    ln -snf ${userSettings.dotfilesDir}/config/wofi $HOME/.config/wofi
    ln -snf ${userSettings.dotfilesDir}/config/dunst $HOME/.config/dunst
    ln -snf ${userSettings.dotfilesDir}/config/systemd $HOME/.config/systemd
  '';
  
}
