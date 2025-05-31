{ config, pkgs, ... }:

{
    virtualisation.vmware = {
        host.enable = true;
        guest.enable = true;
    };
    
    environment.systemPackages = with pkgs; [
        vmware-workstation # Use `vmware-player` for free version
        open-vm-tools  # VMware guest tools
    ];

    users.users.aadithyan.extraGroups = [ "vboxusers" "libvirtd" "kvm" "disk" ];
}