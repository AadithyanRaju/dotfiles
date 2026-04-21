#!/usr/bin/env bash
echo "00FF00" | sudo tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone01
echo "0000FF" | sudo tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone00
echo "FFFFFF" | sudo tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone03
echo "FF0000" | sudo tee /sys/devices/platform/omen-rgb-keyboard/rgb_zones/zone02
