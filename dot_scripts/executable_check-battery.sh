#!/usr/bin/env bash

state=$(cat /sys/class/power_supply/BAT0/status)
percentage=$(cat /sys/class/power_supply/BAT0/capacity)
limit=20

if [ "$percentage" -le "$limit" ] && [ "$state" = "Discharging" ]; then
  notify-send -u critical "Battery is at $percentage%!"
fi
