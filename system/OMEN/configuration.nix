{ config, pkgs, userSettings, ... }:

{
  imports =[ 
    ../base.nix

    ./gaming.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ./systemPackages.nix
    
    ../ai/gemini.nix
    ../virtualisation/kvm.nix
    
    ../applications/development/ccpp.nix
    ../applications/development/pentest.nix
    ];
}

