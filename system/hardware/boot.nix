{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    loader = {
      grub = {
        enable = true;
        #useOSProber = true;
        device = "nodev";
        efiSupport = true;
        configurationLimit = 5;
      };
      timeout = 3;
      efi.canTouchEfiVariables = true;
    };
  };
}