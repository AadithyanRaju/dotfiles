{ config, pkgs, ... }:

{
  virtualisation.oci-containers.containers.jellyfin = {
    image = "jellyfin/jellyfin:latest";
    autoStart = true;
    extraOptions = [ "--network=host" "--device=/dev/dri" ];
    volumes = [
      "/data/Jellyfin/config:/config"
      "/data/Jellyfin/cache:/cache"
      "/data/Jellyfin/media:/media"
      "/dev/dri:/dev/dri"
    ];
  };
  networking.firewall = {
    allowedTCPPorts = [ 8096 8920 ];
    allowedUDPPorts = [ 1900 7359 ];
  };
}