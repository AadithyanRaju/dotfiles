{ config, pkgs, userSettings, ... }:

{
  imports =[ 
    ../base.nix

    ./gaming.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ./systemPackages.nix
    
    ../virtualisation/kvm.nix
    
    ../applications/ai/gemini.nix
    ../applications/development/ccpp.nix
    ../applications/development/pentest.nix
    ];
}

