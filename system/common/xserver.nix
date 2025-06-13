{ config, pkgs, ... }:

{
    services = {
        displayManager = {
          defaultSession = "hyprland";
            #gdm.enable = true;
            sddm.enable = true;
        };
        desktopManager = {
            #gnome.enable = true;
            plasma6.enable = true;
        };
        xserver = {
            enable = true;
            
            #libinput = {
            #  enable = true;
            #  disableWhileTyping = true;
            #};


            xkb.layout = "us";
            videoDrivers = [ "nvidia" ];
        };
   };
}
