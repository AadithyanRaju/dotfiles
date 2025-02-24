{ config, pkgs, ... }:

{
  # CUDA Support
  hardware.nvidia.cudaSupport = true;
  environment.variables.CUDA_PATH = pkgs.cudatoolkit;
}