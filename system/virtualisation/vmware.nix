{ config, pkgs, lib, userSettings, ... }:
with lib;
let
  cfg = config.features.virtualisation.vmware;
in
{
    options.features.virtualisation.vmware = {
        enable = mkOption {
            type = types.bool;
            default = false;
            description = "Enable VMware support.";
        };
    };
    config = mkIf cfg.enable {
        virtualisation.vmware = {
            host.enable = true;
            guest.enable = true;
        };
        nixpkgs.overlays = [ (import ../overlays/vmware-25h2.nix) ];
        environment.systemPackages = with pkgs; [
            vmware-workstation # Use `vmware-player` for free version
            open-vm-tools  # VMware guest tools
        ];
        users.users.${userSettings.username}.extraGroups = [ "vboxusers" "libvirtd" "kvm" "disk" ];
    };
}