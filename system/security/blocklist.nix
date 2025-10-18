{ inputs, config, lib, ... }:
with lib;
let cfg = config.features.security.blocklist; 
in
{  options.features.security.blocklist = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable system-wide blocklist for ads, trackers, malware, gambling";
    };
  };
  config = mkIf cfg.enable {
    networking.extraHosts = ''
      "${builtins.readFile "${inputs.blocklist-hosts}/alternates/gambling-porn/hosts"}"
    '';
  };
}