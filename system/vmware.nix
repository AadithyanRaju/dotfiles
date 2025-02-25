{ config, pkgs, ... }:

{
    virtualisation.vmware.host.enable = true;
    
    environment.systemPackages = with pkgs; [
        vmware-workstation # Use `vmware-player` for free version
        open-vm-tools  # VMware guest tools
    ];

    services = {
        vmware = {
            host.enable = true;
            guest.enable = true;
        };
        vmware-networks.enable = true;
    };
    boot.extraModulePackages = with config.boot.kernelPackages; [
        vmware-modules
    ];

    users.users.aadithyan.extraGroups = [ "vboxusers" "libvirtd" "kvm" "disk" ];
}