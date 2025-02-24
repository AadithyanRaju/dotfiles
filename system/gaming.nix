{ config, pkgs, ... }:

{
  # Enable Nvidia drivers (Proprietary)
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;  
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest; 
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };
  };

  # Gaming Support
  programs.steam.enable = true;
  programs.gamemode.enable = true; # Optimize system for gaming
  programs.gnome-terminal.enable = true;

  # Vulkan, Wine, and Gaming Dependencies
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
      vulkan-extension-layer
      libvdpau
      vaapiVdpau
      libva
      wineWowPackages.stable
    ];
  };

  # Lutris for Non-Steam Games
  programs.lutris.enable = true;
}