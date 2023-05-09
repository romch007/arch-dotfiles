volume=$(pamixer --get-volume)
is_muted=$(pamixer --get-mute)

label=""

if [ "$is_muted" = "true" ]
then
  label=" [Muted]"
fi

echo -e "$volume%$label"
