{ config, pkgs, ... }:

{
    programs = {
        hyprland.enable = true;
        xwayland.enable = true;
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
        #hyprsysteminfo  -- build error CMake Error at src/CMakeLists.txt:15
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

        #Clipboard managers
        cliphist wl-clipboard
    ];
    fonts.packages = with pkgs; [
        font-awesome
    ];
}
