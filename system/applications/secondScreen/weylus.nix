{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.secondScreen;
in
{
  options.features.secondScreen = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Weylus for second screen functionality.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      weylus
      xorg.xrandr
      evdi
    ];
    networking.firewall.allowedTCPPorts = [ 1701 ];
  };
}