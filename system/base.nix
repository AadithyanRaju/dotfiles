{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./applications
      ./common
      ./hardware
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
      outputs.overlays.additions 
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };
}