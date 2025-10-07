{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #Editors
    #jetbrains.idea-ultimate
    neovim
    vim 
    vscode
  ];
}