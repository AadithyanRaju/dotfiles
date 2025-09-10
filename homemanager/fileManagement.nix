{ config, pkgs, lib, ... }:

{
  home.activation.dotfileLinks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p $HOME/.config
    ln -snf /home/aadithyan/.dotfiles/term/zshrc $HOME/.zshrc
    ln -snf /home/aadithyan/.dotfiles/hypr $HOME/.config/hypr
    ln -snf /home/aadithyan/.dotfiles/waybar $HOME/.config/waybar
  '';
}
