#! /bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar top &

if [[ $(xrandr -q | grep 'HDMI-0 connected') ]]; then
	polybar external &
fi
