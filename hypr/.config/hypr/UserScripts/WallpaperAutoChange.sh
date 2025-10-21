#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# source https://wiki.archlinux.org/title/Hyprland#Using_a_script_to_change_wallpaper_every_X_minutes

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script uses bash (not POSIX shell) for the RANDOM variable

wallust_refresh=$HOME/.config/hypr/scripts/RefreshNoWaybar.sh

wallpaper_dir="$HOME/Pictures/wallpapers"

monitors=$(hyprctl monitors | awk '/^Monitor/{print $2}')

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_TYPE=random

# This controls (in seconds) when to switch to the next image
INTERVAL=300

while true; do
  find "$wallpaper_dir" |
    while read -r img; do
      echo "$((RANDOM % 1000)):$img"
    done |
    sort -n | cut -d':' -f2- |
    while read -r img; do
      echo "Setting wallpaper: $img"
      for monitor in $monitors; do
        swww query || swww-daemon --format xrgb && swww img -o "$monitor" "$img"
      done
      $wallust_refresh
      sleep $INTERVAL
    done
done
