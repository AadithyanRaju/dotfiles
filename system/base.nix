{ config, pkgs, ... }:

{
  imports =
    [
      ./features.nix
      ./settings.nix

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