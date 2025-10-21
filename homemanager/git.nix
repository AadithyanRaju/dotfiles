{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "AadithyanRaju";
      email = "aadithyan75@gmail.com";
    };
  };
}