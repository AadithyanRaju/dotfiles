{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    libgcc	
    gcc
    gnumake
    cmake
    extra-cmake-modules
    nasm       #Asm
  ];
}