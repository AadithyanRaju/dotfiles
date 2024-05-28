{ config, pkgs, ... }:

{
  imports =
    [ 
      ./boot.nix
      ./hardware-configuration.nix
      ./sys.nix
      ./time-locale.nix
      ./users.nix
    ];

  networking = {
    hostName = "OMEN"; 
    networkmanager.enable = true;
    hosts = {
      "127.0.0.1" = [ "localhost" "OMEN" ];
      "::1" = [ "localhost" "OMEN" ];
      "13.234.164.24" = [ "server" ];
    };
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   };
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";



  # Enable the X11 windowing system.
  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    
    xserver = {
      enable = true;
      #autorun = true;
      desktopManager.gnome.enable = true;
      #libinput = {
      #  enable = true;
      #  disableWhileTyping = true;
      #};
      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = /home/aadithyan/.config/xmonad/xmonad.hs;
        };
      };
      displayManager = {
        #defaultSession = "gnome";
        gdm.enable = true;
        };
      
      xkb.layout = "us";
      videoDrivers = [ "nvidia" ];
    };
   };

  # Configure keymap in X11
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  
  nixpkgs.config = {
    allowUnfree = true;
    #allowBroken = true;
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    btop
    tree
    vim 
    wget
#    findutils
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      ohMyZsh.theme = "lambda";
      ohMyZsh.enable = true;
      ohMyZsh.plugins = [ "git" ];
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
  
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8000 ];
      allowedUDPPorts = [ 8000 ];
    };
  };
  
  # services.openssh.enable = true;

  nix = {
    settings={
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
      dates = "weekly";
    };
    #copySystemConfiguration = true; #/run/current-system/configuration.nix
    stateVersion = "23.05";
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];
}
