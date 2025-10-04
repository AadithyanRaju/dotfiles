{ config, pkgs, userSettings, ... }:

{
    virtualisation.vmware = {
        host.enable = true;
        guest.enable = true;
    };
    
    environment.systemPackages = with pkgs; [
        vmware-workstation # Use `vmware-player` for free version
        open-vm-tools  # VMware guest tools
    ];

    users.users.${userSettings.username}.extraGroups = [ "vboxusers" "libvirtd" "kvm" "disk" ];
}