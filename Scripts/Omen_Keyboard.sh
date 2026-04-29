#!/usr/bin/env bash
echo "00FF00" | tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone01
echo "0000FF" | tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone00
echo "FFFFFF" | tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone03
echo "FF0000" | tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone02

if [ ! -f /etc/modprobe.d/blacklist-hp-wmi.conf ]; then
    echo "blacklist hp_wmi" | sudo tee /etc/modprobe.d/blacklist-hp-wmi.conf
fi
