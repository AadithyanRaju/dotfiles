{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.services.jellyfin;
in
{
  options.features.services.jellyfin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jellyfin media server in a container.";
    };

    autoStart = mkOption {
      type = types.bool;
      default = true;
      description = "Start Jellyfin automatically at boot.";
    };

    hardwareAcceleration = mkOption {
      type = types.bool;
      default = true;
      description = "Enable hardware acceleration for Jellyfin.";
    };

    storagePath = mkOption {
      type = types.str;
      default = "/data/Jellyfin";
      description = "Base path to store Jellyfin data.";
    };
  };

  config = mkIf cfg.enable {
    features.virtualisation.docker.enable = true;

    networking.firewall = {
      allowedTCPPorts = [ 8096 8920 ];
      allowedUDPPorts = [ 1900 7359 ];
    };

    # Define Jellyfin container
    virtualisation.oci-containers.containers.jellyfin = {
      image = "jellyfin/jellyfin:latest";
      autoStart = cfg.autoStart;

      # Hardware acceleration
      extraOptions =
        [ "--network=host" ]
        ++ optional cfg.hardwareAcceleration "--device=/dev/dri";

      volumes = [
        "${cfg.storagePath}/config:/config"
        "${cfg.storagePath}/cache:/cache"
        "${cfg.storagePath}/media:/media"
      ] ++ optional cfg.hardwareAcceleration "/dev/dri:/dev/dri";
    };
  };
}
