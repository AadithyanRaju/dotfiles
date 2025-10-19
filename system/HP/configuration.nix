{ config, pkgs, userSettings,... }:

{
  imports =
    [ 
      ../base.nix

      ../services/reconnect.nix

      ./hardware-configuration.nix
    ];

  
  
  

  features = {
    hardware = {
      noSleep.enable = true;
      nvidia.enable = false;
      amdgpu.enable = true;
    };
    services = {
      jellyfin.enable = true;
      qbittorrent.enable = true;
      updateSystem.enable = true;
    };
    security = {
      openssh = {
        enable = true;
        allowSFTP = true;
      };
      sudo.allowNixRebuild = true;
    };
    gaming.enable = true;
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

  
}

