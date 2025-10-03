{ config, pkgs, userSettings, ... }:

{
  imports =
    [ 
      ../base.nix
      ./gaming.nix
      ./systemPackages.nix
      ../virtualisation/kvm.nix

      ./hardware-configuration.nix
      ./nvidia.nix
    ];



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

