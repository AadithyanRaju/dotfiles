{ config, lib, pkgs, ... }:
with lib;
let cfg = config.features.security.openvpn; 
in
{
  options.features.security.openvpn = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable OpenVPN service.";
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.openvpn ];
    environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
  };
}