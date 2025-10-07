{ config, pkgs, userSettings, ... }:

{
  imports =[ 
    ../base.nix
    ../features.nix

    ./gaming.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ./systemPackages.nix
    
    ../virtualisation/kvm.nix
    ../applications/development/ccpp.nix
    ../applications/development/pentest.nix
    ];
  
  features = {
    cli.gemini.enable = false;
    apps.editors = {
      vscode.enable = true;
      zed.enable = false;
      intellijUltimate.enable = false;
    };
  };
}

