#!/bin/bash
path=$(pwd)
#Check if the script is run as root
if [ "$EUID" -ne 0 ];then
    echo "Please run as root"
    echo "run sudo $0"
    exit
fi

# check if the machine is a virtual machine
read -p "Is this a virtual machine? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    # Network configuration
    echo "Network configuration"
    add=$(add_network)
    read -p "Enter ssid: " ssid
    read -p "Enter password: " password
    set_network $add ssid $ssid
    set_network $add psk $password
    set_network $add key_mgmt WPA-PSK
    enable_network $add
    echo "Network configuration done"
fi

echo "This script is for bios/legacy boot"
echo "If you are using UEFI, please exit and run the UEFI script"
read -p "Continue? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    exit
fi

# Partitioning
echo "Partitioning"
parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1MB 100%
parted /dev/sda -- set 1 boot on

# Formatting
echo "Formatting"
mkfs.ext4 -L nixos /dev/sda1

# Mounting
echo "Mounting"
mount /dev/disk/by-label/nixos /mnt

# Installing
echo "Installing"
nixos-generate-config --root /mnt
if [ -f ./configuration.nix ];then
    cp configuration.nix /mnt/etc/nixos/
    nixos-install
else if [ -f $path/configuration.nix ];then
    cp $path/configuration.nix /mnt/etc/nixos/
    nixos-install
else if [ -f $path/nixos/configuration.nix ];then
    cp $path/nixos/configuration.nix /mnt/etc/nixos/
    nixos-install
else
    echo "No configuration.nix found"
    exit
fi
