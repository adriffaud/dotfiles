#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u adriffaud -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# for m in $(polybar --list-monitors | cut -d":" -f1); do
# 	  MONITOR=$m polybar --reload default -c ~/.config/polybar/config &
# done

MONITOR=$(xrandr | grep "primary" | awk '{ print$1 }' ) WIRELESS=$(ls /sys/class/net/ | grep wl | awk 'NR==1{print $1}') polybar --reload -c ~/.config/polybar/config default
