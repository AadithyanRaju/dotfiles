{ config, lib, ... }:
with lib;
let
  cfg = config.features.hardware.noSleep;
in 
{
  options.features.hardware.noSleep = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Disables Sleep in lid close";
    };
  };
  config = mkIf cfg.enable {
    services.logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchDocked = "ignore";
      HandleLidSwitchExternalPower = "ignore";
    };
  };
}