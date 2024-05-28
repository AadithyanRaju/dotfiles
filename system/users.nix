{ config, pkgs, ... }:

{
    users.users.aadithyan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      discord
      git
      gitkraken
      opera
      vscode
      zoxide
    ];
  };
}