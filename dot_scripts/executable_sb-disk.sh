	df -h | grep mapper/root | awk 'OFS="/" {print $3,$2}'
