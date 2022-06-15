#! /bin/bash

cpu() {
	result=$(iostat -c 1 2 | sed '/^\s*$/d' | tail -n 1 | awk '{printf 100-$NF}')
	echo -e " $result%"
}

disk() {
	result=$(df -h | grep sda1 | awk 'OFS="/" {print $3,$2}')
	echo -e " $result"
}

mem() {
	result=$(awk '/^Mem/ {print $3}' <(free -mh))
	echo -e " $result"
}

custom_date() {
  result=$(date +"%A %B %d %H:%M")
  echo -e $result
}

while true; do
  xsetroot -name "$(cpu) | $(mem) | $(disk) | $(custom_date)"
	sleep 2s
done
