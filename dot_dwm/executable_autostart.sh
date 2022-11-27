#! /bin/bash

cpu() {
	result=$(iostat -c 1 2 | sed '/^\s*$/d' | tail -n 1 | awk '{printf 100-$NF}')
	echo -e " $result%"
}

disk() {
	result=$(df -h | grep sda2 | awk 'OFS="/" {print $3,$2}')
	echo -e " $result"
}

mem() {
	result=$(awk '/^Mem/ {print $3}' <(free -mh))
	echo -e " $result"
}

battery() {
  battery_status=$(cat /sys/class/power_supply/BAT0/status)
  if [ "$battery_status" = "Charging" ]
  then
    icon=""
  else
    icon=""
  fi

  result=$(cat /sys/class/power_supply/BAT0/capacity)
  echo -e "$icon $result%"
}

custom_date() {
  result=$(date +"%A %B %d %H:%M")
  echo -e $result
}

volume() {
  volume_level=$(pamixer --get-volume)
  muted=$(pamixer --get-mute)
  if [ "$muted" = "true" ]
  then
    echo -e " [Muted]"
  else
    echo -e " $volume_level%"
  fi
}

while true; do
  xsetroot -name "$(volume) | $(battery) | $(cpu) | $(mem) | $(disk) | $(custom_date)"
	sleep 2s
done
