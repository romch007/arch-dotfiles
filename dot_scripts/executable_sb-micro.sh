is_muted=$(pamixer --default-source --get-mute)

if [ "$is_muted" = "true" ]
then
  label="OFF"
else
  label="ON"
fi

echo -e "Micro [$label]"
