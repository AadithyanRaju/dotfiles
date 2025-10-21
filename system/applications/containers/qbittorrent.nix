{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.features.services.qbittorrent;
in
{
  options.features.services.qbittorrent = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable qBittorrent container.";
    };

    autoStart = mkOption {
      type = types.bool;
      default = true;
      description = "Start qBittorrent automatically at boot.";
    };

    storagePath = mkOption {
      type = types.str;
      default = "/data/qbittorrent";
      description = "Base directory for qBittorrent storage (config, downloads, appdata).";
    };

    webUIPort = mkOption {
      type = types.int;
      default = 8080;
      description = "Port for the qBittorrent Web UI.";
    };

    allowFirewallBypass = mkOption {
      type = types.bool;
      default = true;
      description = "Allow qBittorrent to bypass the firewall (not recommended).";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      virtualisation.docker.enable = true;

      virtualisation.oci-containers.containers.qbittorrent = {
        image = "lscr.io/linuxserver/qbittorrent:latest";
        autoStart = cfg.autoStart;
        extraOptions = [ "--network=host" ];

        environment = {
          PUID = "1000";
          PGID = "100";
          TZ = "Asia/Kolkata";
          UMASK_SET = "022";
          WEBUI_PORT = builtins.toString cfg.webUIPort;
        };

        volumes = [
          "${cfg.storagePath}/appdata:/appdata"
          "${cfg.storagePath}/downloads:/downloads"
          "${cfg.storagePath}/config:/config"
        ];
      };

      networking.firewall = {
        allowedTCPPorts = lib.mkDefault [ 6881 ];
        allowedUDPPorts = lib.mkDefault [ 6881 ];
      };
    })

    (mkIf cfg.allowFirewallBypass {
      networking.firewall.allowedTCPPorts = lib.mkDefault [ cfg.webUIPort  ];
    })
  ];
}
