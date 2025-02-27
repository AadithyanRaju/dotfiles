{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gnome-tweaks
        fetchFromGitHub
    ];

    fonts.packages = with pkgs; [
        (pkgs.fetchFromGitHub {
            owner = "EliverLara";
            repo = "candy-icons";
            rev = "75e873759d68b0fe3b52c7939edeb83f01db769b";
            sha256 = "0f809qyj6mxgms7lwixa0l0m2s5rznfp8bqaql1ysq911rmvq4xl";
        })
    ];
    
    programs.dconf.enable = true;
    
    environment.etc = {
        "gtk-3.0/settings.ini".text = ''
            [Settings]
            gtk-icon-theme-name=Candy
        '';
    };
    services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
        [org.gnome.desktop.interface]
        icon-theme='Candy'
    '';
}