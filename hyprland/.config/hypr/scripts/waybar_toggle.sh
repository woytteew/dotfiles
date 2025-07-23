last_ws=1

while true; do
	ws=$(hyprctl activeworkspace -j | jq '.id')
	if [ "$ws" != "$last_ws" ]; then
		if [ "$ws" -ge 1 ] && [ "$ws" -le 4 ]; then
			if [ "$last_ws" -ge 5 ] && [ "$last_ws" -le 10 ]; then
				pkill -SIGUSR1 waybar # hide waybar
			fi
		elif [ "$ws" -ge 5 ] && [ "$ws" -le 10 ]; then
			if [ "$last_ws" -ge 1 ] && [ "$last_ws" -le 4 ]; then
				pkill -SIGUSR2 waybar # show
			fi
		fi
		last_ws="$ws"
	fi
	sleep 0.2
done
