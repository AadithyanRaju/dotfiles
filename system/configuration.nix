{ config, pkgs, ... }:

{
  imports =
    [ 
      ./cuda.nix
      ./docker.nix
      ./gaming.nix
      ./ld.nix
      ./sys.nix
      ./systemPackages.nix
      ./users.nix
      ./xserver.nix

      # Do Not Touch
      ./boot.nix
      ./hardware-configuration.nix
      ./network.nix
      ./settings.nix
      ./time-locale.nix
    ];

  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;

   };

  # Configure keymap in X11
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";


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
  
  # services.openssh.enable = true;

}

