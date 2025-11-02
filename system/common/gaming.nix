{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.gaming;
in
{
  options.features.gaming = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable gaming support (Steam, Proton, Wine, Vulkan, etc.).";
    };
  };
  config = mkIf cfg.enable {  # Gaming Support
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
              libva-vdpau-driver
              libva
              wineWowPackages.stable
          ];
      };
    };

      # Lutris for Non-Steam Games
    environment.systemPackages = with pkgs; [
      (heroic.override {
        extraPkgs = pkgs: [
          pkgs.gamescope
        ];
      })
      #lutris
      gamemode
      mesa-demos
      mesa
      protonup-qt
      steam
      steam-run
    ];
  };
}