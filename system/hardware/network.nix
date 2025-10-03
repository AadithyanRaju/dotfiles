{ config, pkgs, hostName, ... }:

{
    networking = {
        hostName = hostName;
        networkmanager.enable = true;
        enableIPv6 = false;
        hosts = {
            "127.0.0.1" = [ "localhost" hostName ];
            "::1" = [ "localhost" hostName ];
        };
        firewall.enable = true;
   };
}