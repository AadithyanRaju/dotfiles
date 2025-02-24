{ config, pkgs, ... }:

{
    users.users.aadithyan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      telegram-desktop
      discord
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