{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.communication;
in
{
  options.features.communication = {
    telegram.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Telegram desktop client.";
    };
    signal.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Signal desktop client.";
    };
    discord.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Discord desktop client.";
    };
  };

  config = mkMerge [
    (mkIf cfg.telegram.enable {
      environment.systemPackages = with pkgs; [ telegram-desktop ];
    })
    (mkIf cfg.signal.enable {
      environment.systemPackages = with pkgs; [ signal-desktop ];
    })
    (mkIf cfg.discord.enable {
      environment.systemPackages = with pkgs; [ discord ];
    })
  ];
}