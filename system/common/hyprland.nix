{ config, pkgs, ... }:

{
    programs = {
        hyprland.enable = true;
        #xwayland.enable = true;
    };
    environment.systemPackages = with pkgs; [
        
        brightnessctl
        pavucontrol
        playerctl

        hyprcursor
        hyprgraphics
        hypridle
        hyprland
        hyprland-qt-support
        hyprland-qtutils
        hyprlang
        hyprlock
        hyprpaper
        hyprpolkitagent
        hyprshot
        hyprsysteminfo
        hyprutils
        hyprwayland-scanner
        kitty
        waybar
        wofi
        xdg-desktop-portal-hyprland
        
        libnotify
        networkmanagerapplet
        networkmanager_dmenu
        swaynotificationcenter
    ];
    fonts.packages = with pkgs; [
        font-awesome
    ];
}
