{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.git;
in
{
  options.features.git = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install Git and related tools.";
    };
    gitkraken = mkOption {
      type = types.bool;
      default = false;
      description = "Install GitKraken GUI client.";
    };
  };
  config = mkMerge [
    (mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          git
          gh
        ];
    })
    (mkIf cfg.gitkraken {
        environment.systemPackages = with pkgs; [
          gitkraken
        ];
    })
  ];
}