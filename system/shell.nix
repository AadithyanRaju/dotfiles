{ config, pkgs, ... }:

{
    programs = {
        zsh = {
            enable = true;
            enableCompletion = true;
            ohMyZsh.theme = "lambda";
            ohMyZsh.enable = true;
            ohMyZsh.plugins = [ "git" ];
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
        };
    };
}
  