#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload mybar &
    MONITOR=$m polybar --reload main-bottom-tray &
    MONITOR=$m polybar --reload main-bottom &
	done
else
	polybar --reload mybar &
  polybar --reload main-bottom-tray &
  polybar --reload main-bottom &
fi
