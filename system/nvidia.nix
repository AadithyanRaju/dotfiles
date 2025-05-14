{ config, pkgs, ... }:

{
  # Enable Nvidia drivers (Proprietary)
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;  
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest; 
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      amdgpuBusId = "PCI:7:0:0";  # Adjust based on your output
      nvidiaBusId = "PCI:1:0:0";  # Adjust based on your output
    };
  };
}