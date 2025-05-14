{ config, pkgs, ... }:

{

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