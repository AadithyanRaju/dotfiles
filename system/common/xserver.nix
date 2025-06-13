{ config, pkgs, ... }:

{
    services = {
        displayManager = {
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
            windowManager = {
              xmonad = {
                enable = true;
                enableContribAndExtras = true;
                config = /home/aadithyan/.dotfiles/xmonad/xmonad.hs;
              };
            };


            xkb.layout = "us";
            videoDrivers = [ "nvidia" ];
        };
   };
}
