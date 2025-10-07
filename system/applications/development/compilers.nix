{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.features.compilers;
in
{
  options.features.compilers = {
    ccpp.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install C/C++ compilers and build tools.";
    };
    haskell.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Haskell compiler and build tools.";
    };
    go.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Go programming language.";
    };
    java.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Java Development Kit (JDK).";
    };
    nodejs.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Node.js JavaScript runtime.";
    };
  };
  config = mkMerge [
    (mkIf cfg.ccpp.enable {
      environment.systemPackages = with pkgs; [
        libgcc	
        gcc
        gnumake
        cmake
        extra-cmake-modules
        nasm       #Asm
      ];
    })
    (mkIf cfg.haskell.enable {
      environment.systemPackages = with pkgs; [
        ghc
      ];
    })
    (mkIf cfg.go.enable {
      environment.systemPackages = with pkgs; [
        go
      ];
    })
    (mkIf cfg.java.enable {
      environment.systemPackages = with pkgs; [
        jdk8
      ];
    })
    (mkIf cfg.nodejs.enable {
      environment.systemPackages = with pkgs; [
        nodejs_24
        yarn
      ];
    })
  ];
}