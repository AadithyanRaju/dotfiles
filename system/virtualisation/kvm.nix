{ config, lib, pkgs, userSettings, ... }:
with lib;
let 
  cfg = config.features.virtualisation.kvm;
in
{
  options.features.virtualisation.kvm = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable KVM support.";
    };
  };
  config = mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu.runAsRoot = false;
    };
    virtualisation.spiceUSBRedirection.enable = true;


    users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ]; 
    environment.systemPackages = with pkgs; [
      virt-manager
      qemu
      spice-gtk  # Optional for better display support
      dnsmasq    # For NAT networking
      bridge-utils
      libvirt
    ];

    systemd.services.libvirtd.wantedBy = [ "multi-user.target" ];
    boot.kernelModules = [ "kvm_amd" "kvm" ];

    environment.etc."polkit-1/rules.d/50-libvirt.rules".text = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.libvirt.unix.manage" &&
            subject.isInGroup("libvirtd")) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
