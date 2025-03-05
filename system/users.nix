{ config, pkgs, ... }:

{
    users.users.aadithyan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      
    ];
  };
}