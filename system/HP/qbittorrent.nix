{ config, pkgs, ... }:

{
  virtualisation.oci-containers.containers.qbittorrent = {
    image = "lscr.io/linuxserver/qbittorrent:latest";
    autoStart = true;
    extraOptions = [ "--network=host" ];
    environment = {
      PUID = "1000";
      PGID = "1000";
      TZ = "Asia/Kolkata";
      UMASK_SET = "022";
      WEBUI_PORT = "8080";
    };
    volumes = [
      "/data/qbittorrent/appdata:/appdata"
      "/data/qbittorrent/downloads:/downloads"
    ];
  };
}
