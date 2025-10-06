{ config, pkgs, userSettings, ... }:
{
  programs.git = {
    enable = true;
    userName = userSettings.git.userName;
    userEmail = userSettings.git.userEmail;
  };
}