{ config, lib, pkgs, ... }:
let
  reconnectScript = pkgs.writeShellScriptBin "wifi-reconnect" ''
    #!/usr/bin/env bash
    set -e

    # Ping Cloudflare DNS
    if ! ping -c 3 -W 5 1.1.1.1 > /dev/null 2>&1; then
      echo "[!] Network down, trying to reconnect..."

      # Disconnect and reconnect using NetworkManager
      nmcli radio wifi off
      sleep 3
      nmcli radio wifi on

      # Alternatively: reconnect specific connection
      # nmcli con up id "YOUR_WIFI_NAME"
    fi
  '';
in
{
  environment.systemPackages = [ reconnectScript ];

  systemd.services.wifi-reconnect = {
    description = "Check network and reconnect WiFi if needed";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${reconnectScript}/bin/wifi-reconnect";
    };
  };

  systemd.timers.wifi-reconnect = {
    description = "Run WiFi reconnect check every 3 minutes";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1min";
      OnUnitActiveSec = "3min";
      Persistent = true;
    };
  };
}
