{ config, lib, pkgs, ... }:
with lib;let 
cfg = config.features.apps.editors;
in
{
  options.features.apps.editors = {
    vscode.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable VSCode editor.";
    };
    zed.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Zed editor.";
    };
    intellijUltimate.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable IntelliJ Ultimate IDE.";
    };
  };
  config = mkMerge [
    (mkIf cfg.vscode.enable {
      environment.systemPackages = with pkgs; [
        vscode
      ];
    })
    (mkIf cfg.zed.enable {
      environment.systemPackages = with pkgs; [
        zed-editor
      ];
    })
    (mkIf cfg.intellijUltimate.enable {
      environment.systemPackages = with pkgs; [
        jetbrains.idea-ultimate
      ];
    })
  ];
  environment.systemPackages = with pkgs; [
    neovim
    vim 
  ];
}