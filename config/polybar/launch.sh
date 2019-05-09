#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u adriffaud -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -r default -c ~/.config/polybar/config.ini &
