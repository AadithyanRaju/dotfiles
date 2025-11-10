{ config, pkgs, inputs, ... }:

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
  nixpkgs.overlays = [ 
    (final: prev:
    let stablePkgs = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
    in {
      stable = stablePkgs;
    }
  )
  ];
}