{ config, pkgs, ... }:

{
    services = {
        xserver = {
            enable = true;
            desktopManager.gnome.enable = true;
            #libinput = {
            #  enable = true;
            #  disableWhileTyping = true;
            #};
            #windowManager = {
            #  xmonad = {
            #    enable = true;
            #    enableContribAndExtras = true;
            #    config = /home/aadithyan/.config/xmonad/xmonad.hs;
            #  };
            #};
            displayManager = {
              #defaultSession = "gnome";
              gdm.enable = true;
              };
            xkb.layout = "us";
            videoDrivers = [ "nvidia" ];
        };
   };
}