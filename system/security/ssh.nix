{ config, lib, pkgs, ... }:
with lib;
let cfg = config.features.security.openssh; in
{
  options.features.security.openssh = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable OpenSSH service.";
    };
    allowSFTP = mkOption {
      type = types.bool;
      default = false;
      description = "Allow SFTP access.";
    };
  };
  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      allowSFTP = cfg.allowSFTP;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };
  };
}