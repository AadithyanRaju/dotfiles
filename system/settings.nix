{ config, pkgs, ... }:

{
    nix = {
        settings={
            warn-dirty = false;
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
            substituters = ["https://nix-gaming.cachix.org"];
            trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
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