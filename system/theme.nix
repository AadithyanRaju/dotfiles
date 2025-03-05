{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        (pkgs.stdenv.mkDerivation {
            pname = "candy-icons";
            version = "latest";
            src = pkgs.fetchFromGitHub {
                owner = "EliverLara";
                repo = "candy-icons";
                rev = "75e873759d68b0fe3b52c7939edeb83f01db769b";
                sha256 = "0f809qyj6mxgms7lwixa0l0m2s5rznfp8bqaql1ysq911rmvq4xl";
            };
            installPhase = ''
                mkdir -p $out/share/icons
                cp -r $src/* $out/share/icons/Candy
            '';
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