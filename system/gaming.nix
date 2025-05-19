{ config, pkgs, ... }:

{

  # Gaming Support
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs = {
    gamemode.enable = true; # Optimize system for gaming
    gamescope.enable = true;
  };
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
  (heroic.override {
    extraPkgs = pkgs: [
      pkgs.gamescope
    ];
  })
}