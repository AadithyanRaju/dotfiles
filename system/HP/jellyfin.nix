{ config, pkgs, ... }:

{
    virtualisation.oci-containers.containers.jellyfin = {
        image = "jellyfin/jellyfin:latest";
        autoStart = true;
        extraOptions = [ "--network=host" ];
        volumes = [
          "/data/Jellyfin/config:/config"
          "/data/Jellyfin/cache:/cache"
          "/data/Jellyfin/media:/media"
        ];
    };      

}