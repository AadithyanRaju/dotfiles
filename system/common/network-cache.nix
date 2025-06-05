{ config, pkgs, ... }:
let
  keyDir = "/etc/nix-serve";
  privateKeyFile = "${keyDir}/private-key";
in {
    networking.firewall.allowedTCPPorts = [ 5000 3128 ];
    systemd.services.generate-nix-serve-key = {
        description = "Generate nix-serve keypair";
        wantedBy = [ "multi-user.target" ];
        before = [ "nix-serve.service" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = pkgs.writeShellScript "generate-nix-serve-key" ''
            mkdir -p ${keyDir}
            if [ ! -f "${privateKeyFile}" ]; then
              echo "Generating nix-serve cache key..."
              ${pkgs.nix}/bin/nix-store --generate-binary-cache-key local-cache \
                ${privateKeyFile} ${keyDir}/public-key
            fi
          '';
        };
    };
    services = {
        nix-serve = {
            enable = true;
            secretKeyFile = "/etc/nix-serve/private-key";
            port = 5000;
        };
        squid = {
            enable = true;
            configFile = "/etc/squid/squid.conf";
        };
    };
    environment.etc."squid/squid.conf".text = ''
        http_port 3128
        cache_dir ufs /var/cache/squid 70000 16 256
        access_log /var/log/squid/access.log
        cache_mem 128 MB
        maximum_object_size 256 MB
        minimum_object_size 0 KB
        cache_swap_low 90
        cache_swap_high 95

        acl localnet src 192.168.0.0/16
        http_access allow localnet
        http_access deny all
    '';
    nix = {
        settings={
            substituters = [ http://localhost:5000 ];
            trusted-public-keys = [local-cache:rF2zmc8TWW98wozv+zOYRBiShXBLw7bR+LSbe+f7wdo=];
        };
    };
}