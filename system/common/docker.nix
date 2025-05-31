{ config, pkgs, ... }:

{
  # Docker Support
  virtualisation.docker.enable = true;
  users.users.aadithyan.extraGroups = [ "docker" ];

}