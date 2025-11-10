{ pkgs, userSettings, ... }:

{
  imports =[ 
    ../base.nix
    ./hardware-configuration.nix
    ./systemPackages.nix
    
    ];
  
  features = {
    apps = {
      browsers = {
        chrome.enable = true;
        vivaldi.enable = true;
      };
      communication = {
        signal.enable = true;
      };
      editors = {
        vscode.enable = true;
        zed.enable = true;
        intellijUltimate.enable = false;
      };
    };
    cli.ai.gemini.enable = false;
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
        ida-free
        sqlitebrowser
        openvpn
       ];
    };
    virtualisation = {
      kvm.enable = true;
    };
    hardware = {
      printing.enable = true;
      nvidia = {
        enable = true;
        hasAmdGPU = true;
        amdgpuBusId = "PCI:7:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    gaming.enable = true;
    services.qbittorrent = {
      enable = false;
      storagePath = "${userSettings.userHome}/data/qbittorrent";
      allowFirewallBypass = false;
    };
    secondScreen.enable = false;
    git.gitkraken = true;
  };
}

