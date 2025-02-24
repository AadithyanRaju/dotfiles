{ config, pkgs, ... }:

{
    nix = {
        settings={
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };

    system = {
        autoUpgrade = {
            enable = true;
            channel = "https://nixos.org/channels/nixos-unstable";
            dates = "weekly";
        };
        #copySystemConfiguration = true; #/run/current-system/configuration.nix
        stateVersion = "24.05";
    };
}