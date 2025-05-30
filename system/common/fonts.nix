{ config, pkgs, ... }:

{
    fonts = {
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-emoji
            font-awesome
            source-han-sans
            source-han-sans-japanese
            source-han-serif-japanese
            nerdfonts.meslo
        ];
        fontconfig = {
            enable = true;
            defaultFonts = {
                monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
                serif = ["Noto Serif" "Source Han Serif"];
                sansSerif = ["Noto Sans" "Source Han Sans"];
            };
        };
    };
}