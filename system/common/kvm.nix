{
  virtualisation.libvirtd.enable = true;

  users.users.aadithyan.extraGroups = [ "libvirtd" "kvm" ]; 
  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    spice-gtk  # Optional for better display support
    dnsmasq    # For NAT networking
    bridge-utils
    libvirt
  ];
}
