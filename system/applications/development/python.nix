{ config, pkgs, ... }:

{
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
}