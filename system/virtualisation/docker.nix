{ config, libs, pkgs, userSettings, ... }:
with lib;
let 
  cfg = config.features.virtualisation.docker;
in
{
  options.features.virtualisation.docker = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Docker support.";
    };
  };
  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.users.${userSettings.username}.extraGroups = [ "docker" ];
  };
}