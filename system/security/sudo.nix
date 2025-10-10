{ config, lib, pkgs, userSettings, ... }:
with lib;
let
  cfg = config.features.security.sudo;
in
{
  options.features.security.sudo = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Sudo";
    };
    allowNixRebuild = mkOption {
      type = types.bool;
      default = false;
      description = "Allow Nix Rebuild without password";
    };
  };
  config = mkMerge [
    (mkIf cfg.enable{
      security.sudo = {
        enable = true;
        #wheelNeedsPassword = false;
      };
    })
    (mkIf cfg.allowNixRebuild {
      security.sudo.extraRules = [
        {
          users = [ userSettings.username ];
          commands = [
            { command = "${pkgs.nixos-rebuild}/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
          ];
        }
      ];
    })
  ];
}