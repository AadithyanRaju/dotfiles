{ config, pkgs, lib, ... }:

{
  home.activation.dotfileLinks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p $HOME/.config
    ln -snf /home/aadithyan/.dotfiles/term/zshrc $HOME/.zshrc
    ln -snf /home/aadithyan/.dotfiles/config/hypr $HOME/.config/hypr
    ln -snf /home/aadithyan/.dotfiles/config/waybar $HOME/.config/waybar
    ln -snf /home/aadithyan/.dotfiles/config/wofi $HOME/.config/wofi
    ln -snf /home/aadithyan/.dotfiles/config/dunst $HOME/.config/dunst
    ln -snf /home/aadithyan/.dotfiles/config/systemd $HOME/.config/systemd
  '';
  
}
