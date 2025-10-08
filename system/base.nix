{ config, pkgs, ... }:

{
  imports =
    [
      ./applications
      ./common
      ./hardware
      ./settings.nix
      ./services
      ./scurity
      ./virtualisation


      ./user/locales.nix
      ./user/shell.nix
      ./user/users.nix

    ];
  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
  };
}