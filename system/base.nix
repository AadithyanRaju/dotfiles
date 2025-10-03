{ config, pkgs, ... }:

{
  imports =
    [
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
    ];
}