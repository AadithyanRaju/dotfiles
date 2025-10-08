{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.features.services.updateSystem;
in
{
  options.features.services.updateSystem = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "A service for system update";
    };
  };
  config = mkIf cfg.enable {
    systemd.services.update-dotfiles = {
      description = "Update dotfiles repo and rebuild NixOS";
      serviceConfig = {
        Type = "oneshot";
        User = "aadithyan";
        ExecStart = "/home/aadithyan/.dotfiles/Scripts/update-dotfiles.sh";
        StandardOutput = "journal";
        StandardError = "journal";
      };
    };

    systemd.timers.update-dotfiles = {
      description = "Hourly dotfiles update";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "hourly";
        Persistent = true;
      };
    };
  };
}
