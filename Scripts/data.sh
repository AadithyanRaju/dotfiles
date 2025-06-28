#!/bin/bash

# Usage: ./data.sh <data_left_in_GB>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <data_left_in_GB>"
    exit 1
fi

data_left=$1
total_data=200

if ! [[ "$data_left" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Please enter a valid number for data left."
    exit 1
fi

# Calculate days left in the current month (including today)
today=$(date +%d)
last_day=$(date -d "$(date +%Y-%m-01) +1 month -1 day" +%d)
days_left=$((last_day - today + 1))

if [ "$days_left" -le 0 ]; then
    echo "No days left in this month."
    exit 1
fi

# Calculate daily limit without using bc
daily_limit=$(awk "BEGIN { printf \"%.2f\", $data_left / $days_left }")

echo "You can use up to $daily_limit GB per day for the remaining $days_left days."