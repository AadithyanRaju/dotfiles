{ config, pkgs, dotfilesPath, ... }:

{
  home.file = {
    ".zshrc".source = builtins.path { path = "${dotfilesPath}/term/zshrc"; };
    ".config/hypr".source = builtins.path { path = "${dotfilesPath}/hypr"; };
    ".config/waybar".source = builtins.path { path = "${dotfilesPath}/waybar"; };
  };
}
