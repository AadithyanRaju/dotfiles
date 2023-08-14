# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:
let
  user="aadithyan";
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
        configurationLimit = 5;
      };
      timeout = 5;
    };
  };
  networking = {
    hostName = "raju" ;
    networkmanager = {
      enable = true;
    };
  };
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  services = {
    xserver = {
      enable = true;
      layout = "us";
      displayManager = {
        lightdm.enable = true;
        defaultSession = "xfce";
      };
      desktopManager.xfce.enable = true;
    };
    openssh.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    packages = with pkgs; [
      gnome.gedit
      gnutar
      netcat-openbsd
      tree
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brave
    git
    vim
    wget
  ];
  # nixpkgs.config.allowUnfree = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;


  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-23.05";
      dates = "weekly";
    };
    copySystemConfiguration = true;
    stateVersion = "23.05";
  };
}
