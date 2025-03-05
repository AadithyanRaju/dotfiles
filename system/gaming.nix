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
      amdgpuBusId = "PCI:7:0:0";  # Adjust based on your output
      nvidiaBusId = "PCI:1:0:0";  # Adjust based on your output
    };
  };

  # Gaming Support
  programs.steam.enable = true;
  programs.gamemode.enable = true; # Optimize system for gaming
  programs.gnome-terminal.enable = true;

  # Vulkan, Wine, and Gaming Dependencies
  hardware = {
    graphics = {
        enable = true;
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
  };

    # Lutris for Non-Steam Games
    environment.systemPackages = with pkgs; [
      heroic
      lutris
      gamemode
      glxinfo
      mesa
      protonup-qt
      steam
    ];
}