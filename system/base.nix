{ config, pkgs, ... }:

{
  imports =
    [
      ./settings.nix

      ./applications/development/python.nix
      ./applications/utils/common.nix

      ./hardware/bluetooth.nix
      ./hardware/kernel.nix
      ./hardware/network.nix
      ./hardware/printing.nix
      ./hardware/systemd.nix
      ./hardware/time.nix

      ./security/automount.nix
      ./security/blocklist.nix
      ./security/firejail.nix
      ./security/gpg.nix
      ./security/sudo.nix

      ./user/locales.nix
      ./user/shell.nix
      ./user/users.nix

      ./virtualisation/docker.nix
    ];
  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
  };
}