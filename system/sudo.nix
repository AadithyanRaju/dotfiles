{ config, pkgs, ... }:

{

  # Enable sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;


}