{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./applications
      ./common
      ./hardware
      ./overlays
      ./settings.nix
      ./services
      ./security
      ./virtualisation


      ./user/locales.nix
      ./user/shell.nix
      ./user/users.nix

    ];
  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
  };
  nixpkgs = {
    overlays = [ 
      overlays.additions 
      overlays.modifications
      overlays.stable-packages
    ];
  };
}