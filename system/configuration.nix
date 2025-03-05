{ config, pkgs, ... }:

{
  imports =
    [ 
      #./cuda.nix
      ./docker.nix
      ./gaming.nix
      ./ld.nix
      ./sys.nix
      ./systemPackages.nix
      #./theme.nix
      ./users.nix
      ./vmware.nix
      ./xserver.nix

      # Do Not Touch
      ./boot.nix
      ./hardware-configuration.nix
      ./network.nix
      ./settings.nix
      ./shell.nix
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

  # services.openssh.enable = true;

}

