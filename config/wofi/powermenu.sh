#!/usr/bin/env bash

entries=" Power Off\n Reboot\n Suspend\n Lock\n Logout"

selected=$(echo -e "$entries" | wofi --dmenu --cache-file /dev/null --prompt "Power")

case $selected in
    " Power Off") systemctl poweroff ;;
    " Reboot") systemctl reboot ;;
    " Suspend") systemctl suspend ;;
    " Lock") hyprlock ;;
    " Logout") hyprctl dispatch exit ;;
esac
