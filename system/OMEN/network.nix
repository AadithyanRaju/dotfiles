{ config, pkgs, ... }:

{
    networking = {
        hostName = "OMEN"; 
        networkmanager.enable = true;
        enableIPv6 = false;
        hosts = {
            "127.0.0.1" = [ "localhost" "OMEN" ];
            "::1" = [ "localhost" "OMEN" ];
        };
        firewall = {
            enable = false;
            # allowedTCPPorts = [ 8000 ];
            # allowedUDPPorts = [ 8000 ];
        };
        # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


}