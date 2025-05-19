{ config, pkgs, ... }:

{
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs
        # here, NOT in environment.systemPackages
            stdenv.cc.cc.lib
        ];
    };
    environment = {
        sessionVariables = {
            LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        };
    };
}

