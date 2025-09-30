{ config, pkgs, userSettings,... }:

{
    users.users.${userSettings.username} = {
      isNormalUser = true;
      description = userSettings.name;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ]; 
      packages = with pkgs; [
      
      ];
      uid = 1000;
    };
}
