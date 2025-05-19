{ config, pkgs, ... }:

{
  imports =
    [ 
      #./cuda.nix
      ./docker.nix
      ./gaming.nix
      ./ld.nix
      ./systemPackages.nix
      #./theme.nix
      ./vmware.nix

      # Do Not Touch
      ./appimage.nix
      ./boot.nix
      ./bluetooth.nix
      ./fonts.nix
      ./hardware-configuration.nix
      ./network.nix
      ./nvidia.nix
      ./settings.nix
      ./shell.nix
      ./sound.nix
      ./time-locale.nix
      ./users.nix
      ./xserver.nix
    ];

  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
     # printing.enable = true;
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

