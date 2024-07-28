#!/bin/bash

wallpaper_dir="$HOME/Pictures/wallpapers"
array=($(ls $wallpaper_dir))
index=1
for i in "${array[@]}"
do
    echo "$index. $i"
    viu $wallpaper_dir/$i
    index=$((index+1))
done

read -p "Enter the index of the wallpaper you want to set: " index
index=$((index-1))
ln -sf $wallpaper_dir/${array[$index]} $HOME/.config/xmonad/theme/wallpaper

if [ $? -eq 0 ]; then
    echo "Wallpaper set successfully"
else
    echo "Error setting wallpaper"
fi