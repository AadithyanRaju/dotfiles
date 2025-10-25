{ config, pkgs, lib,... }:
with lib;
let cfg = config.features.hardware.amdgpu;
in
{
  options.features.hardware.amdgpu = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable AMD GPU support.";
    };
  };
  config = mkIf cfg.enable {
    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd          # OpenCL runtime
        rocmPackages.rocm-smi         # GPU management
        mesa                          # Mesa drivers
        #mesa.vulkanDrivers            # Vulkan drivers
        vaapiVdpau                    # VA-API to VDPAU bridge
        libvdpau-va-gl                # VDPAU via OpenGL
      ];
    };

    services.xserver.videoDrivers = [ "amdgpu" ];

    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "amdgpu" ];

    environment.systemPackages = with pkgs; [
      vulkan-tools        # includes vulkaninfo
      mesa-demos          # for glxinfo
      radeontop           # GPU monitoring
    ];
  };
}
