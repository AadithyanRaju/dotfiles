{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.python3;
in
{
  options.features.python3 = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install Python3 and useful packages.";
    };
  };
  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      (import ../../overlays/pygame-avx2.nix)
    ];
    environment.systemPackages = with pkgs; [
      (python3.withPackages (subpkgs: with subpkgs; [
        requests
        numpy
        matplotlib
        opencv4
        pandas
        pygame
      ]))
    ];
  };
}