{ config, pkgs, ... }:

{
    users.users.aadithyan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      telegram-desktop
      discord
      git
      gitkraken
      google-chrome
      vlc		
      vscode
      wireshark-qt
      wpsoffice 
      zoxide
    ];
  };
}