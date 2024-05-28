{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 5;
    };
    timeout = 5;
    efi.canTouchEfiVariables = true;
  };
}