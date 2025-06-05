{ config, pkgs, ... }:

{
  home.file = {
    ".zshrc".source = builtins.path { path = "/home/aadithyan/.dotfiles/term/zshrc"; };
    ".config/hypr".source = builtins.path { path = "/home/aadithyan/.dotfiles/hypr"; };
    ".config/waybar".source = builtins.path { path = "/home/aadithyan/.dotfiles/waybar"; };
  };
}
