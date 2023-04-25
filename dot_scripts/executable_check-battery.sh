#!/usr/bin/env bash

percentage=$(cat /sys/class/power_supply/BAT0/capacity)
limit=20

if [ "$percentage" -le "$limit" ]; then
  notify-send -u critical "Battery is at $percentage%!"
fi
