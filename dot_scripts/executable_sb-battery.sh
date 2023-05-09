capacity=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

echo -e "$capacity% [$state]"
