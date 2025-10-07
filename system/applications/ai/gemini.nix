{ config, pkgs, lib, ... }:
with lib;let 
cfg = config.features.cli.gemini;
in
{
  options.features.cli.gemini = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Gemini CLI client.";
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gemini-cli
    ];
  };
}