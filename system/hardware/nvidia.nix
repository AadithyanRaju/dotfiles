{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.hardware.nvidia;
in
{
  options.features.hardware.nvidia = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable NVIDIA GPU support.";
    };
    hasAmdGPU = mkOption {
      type = types.bool;
      default = false;
      description = "Set to true if the system has an AMD GPU alongside the NVIDIA GPU (for PRIME offloading).";
    };
    hasIntelGPU = mkOption {
      type = types.bool;
      default = false;
      description = "Set to true if the system has an Intel GPU alongside the NVIDIA GPU (for PRIME offloading).";
    };
    amdgpuBusId = mkOption {
      type = types.str;
      default = "PCI:7:0:0";
      description = "The PCI bus ID of the AMD GPU (if present).";
    };
    nvidiaBusId = mkOption {
      type = types.str;
      default = "PCI:1:0:0";
      description = "The PCI bus ID of the NVIDIA GPU.";
    };
    intelBusId = mkOption {
      type = types.str;
      default = "";
      description = "The PCI bus ID of the Intel GPU (if present).";
    };
  };
  config = mkIf cfg.enable {
    hardware.graphics.enable = true;
    hardware.nvidia = {
      open = false;  
      package = config.boot.kernelPackages.nvidiaPackages.latest; 
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
      prime = {
        offload.enable = cfg.hasAmdGPU || cfg.hasIntelGPU;
        offload.enableOffloadCmd = cfg.hasAmdGPU || cfg.hasIntelGPU;
        amdgpuBusId = mkIf cfg.hasAmdGPU cfg.amdgpuBusId;
        nvidiaBusId = cfg.nvidiaBusId;
        intelBusId = mkIf cfg.hasIntelGPU cfg.intelBusId;
      };
    };
    services.xserver.videoDrivers =
      [ "nvidia" ]
      ++ optionals cfg.hasAmdGPU [ "amdgpu" ]
      ++ optionals cfg.hasIntelGPU [ "modesetting" ];
    boot.blacklistedKernelModules = [ "nouveau" ];
  };
}