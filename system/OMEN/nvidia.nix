{ config, pkgs, ... }:

{
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;  
    package = config.boot.kernelPackages.nvidiaPackages.latest; 
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      amdgpuBusId = "PCI:7:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
  boot.blacklistedKernelModules = [ "nouveau" ];

}