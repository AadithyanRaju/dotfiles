{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.secondScreen;
in
{
  options.features.secondScreen = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Weylus for second screen functionality.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      weylus
      xorg.xrandr
    ];
    networking.firewall.allowedTCPPorts = [ 1701 ];
    boot.extraModulePackages = with config.boot.kernelPackages; [ evdi ];

    services.xserver.videoDrivers = [ "dummy" ];

    services.xserver.extraConfig = ''
      Section "Monitor"
        Identifier "VIRTUALMONITOR"
        HorizSync 30.0 - 70.0
        VertRefresh 50.0 - 75.0
        Option "DPMS" "false"
      EndSection
  
      Section "Screen"
        Identifier "DummyScreen"
        Device "DummyDevice"
        Monitor "VIRTUALMONITOR"
        DefaultDepth 24
        SubSection "Display"
          Depth 24
          Modes "1920x1080"
        EndSubSection
      EndSection
  
      Section "Device"
        Identifier "DummyDevice"
        Driver "dummy"
        VideoRam 256000
      EndSection
    '';
  };
}