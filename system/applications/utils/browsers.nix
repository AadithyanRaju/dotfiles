{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.browsers;
in
{
  options.features.browsers = {
    firefox.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Firefox web browser.";
    };
    brave.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Brave web browser.";
    };
    chrome.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Google Chrome web browser.";
    };
  };

  config = mkMerge [
    (mkIf cfg.firefox.enable {
      environment.systemPackages = with pkgs; [ firefox ];
    })
    (mkIf cfg.brave.enable {
      environment.systemPackages = with pkgs; [ brave ];
    })
    (mkIf cfg.chrome.enable {
      environment.systemPackages = with pkgs; [ google-chrome ];
    })
  ];
}