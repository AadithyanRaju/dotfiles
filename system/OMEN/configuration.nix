{ config, pkgs, userSettings, ... }:

{
  imports =
    [ 
      ../base.nix
      ./gaming.nix
      ../common/ld.nix
      ./systemPackages.nix
      #../common/virtualbox.nix
      #./common/vmware.nix
      ../common/kvm.nix

      # Do Not Touch
      ../common/appimage.nix
      ../common/boot.nix
      ./hardware-configuration.nix
      ../common/hyprland.nix
      ./nvidia.nix
      ../common/sound.nix
      ../common/xserver.nix
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

