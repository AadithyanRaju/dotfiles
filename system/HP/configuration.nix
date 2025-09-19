{ config, pkgs, ... }:

{
  imports =
    [ 
      #./common/cuda.nix
      ../common/docker.nix
      ../common/ld.nix
      ./systemPackages.nix
      ./reconnect.nix
      ./update.nix
      #./common/theme.nix
      #./common/virtualbox.nix
      #./common/vmware.nix
      #./common/kvm.nix

      # Do Not Touch
      ../common/appimage.nix
      ../common/boot.nix
      ../common/bluetooth.nix
      #./common/fonts.nix
      ./hardware-configuration.nix
      ../common/hyprland.nix
      ./network.nix
      #./common/network-cache.nix
      ../common/settings.nix
      ../common/shell.nix
      ../common/sound.nix
      ../common/time-locale.nix
      ../common/users.nix
      ../common/xserver.nix
    ];

  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
    # printing.enable = true;
    xserver.videoDrivers = [
      "amdgpu"
    ];
   };
  
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchDocked = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
  security.sudo.extraRules = [
    {
      users = [ "aadithyan" ];
      commands = [
        { command = "${pkgs.nixos-rebuild}/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
      ];
    }
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

