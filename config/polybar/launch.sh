#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u adriffaud -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
for m in $(polybar --list-monitors | cut -d":" -f1); do
	  WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload default -c ~/.config/polybar/config.ini &
	  WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload bottom -c ~/.config/polybar/config.ini &
done
