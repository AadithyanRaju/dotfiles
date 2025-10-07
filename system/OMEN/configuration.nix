{ config, pkgs, userSettings, ... }:

{
  imports =[ 
    ../base.nix

    ./gaming.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ./systemPackages.nix
    
    ../virtualisation/kvm.nix
    ];
  
  features = {
    cli.gemini.enable = false;
    apps.editors = {
      vscode.enable = true;
      zed.enable = true;
      intellijUltimate.enable = false;
    };
    compilers = {
      ccpp.enable = true;
      haskell.enable = true;
      go.enable = true;
      java.enable = true;
      nodejs.enable = false;
    };
    pentest = {
      enable = true;
      additionalTools = with pkgs; [
        # burpsuite
        # ghidra
        # thc-hydra
       ];
    };

  };
}

