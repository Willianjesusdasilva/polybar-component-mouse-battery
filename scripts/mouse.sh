output=$(solaar show 2>/dev/null)

battery_percentage=$(echo "$output" | grep -oP 'Battery: \K\d+(?=%)' | head -1)
discharging=$(echo "$output" | grep -oP 'Battery: \d+%, \K\w+' | head -1)
discharging="${discharging^}"

if [ "$discharging" != "Discharging" ]; then
    echo "↑ $battery_percentage% "
else
    echo "↓ $battery_percentage% "
fi

