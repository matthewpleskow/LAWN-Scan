#!/bin/bash

# ISS enabled subnets
subnets=(
    "128.61.0.0/20"
    "128.61.16.0/20"
    "128.61.32.0/20"
    "128.61.48.0/20"
    "128.61.64.0/20"
    "128.61.112.0/20"
    "143.215.48.0/20"
    "143.215.80.0/20"
    "143.215.96.0/20"
    "143.215.112.0/20"
    "128.61.80.0/20"
    "100.70.32.0/19"
    "100.70.0.0/19"
)

current_time=$(date +%s%3N)

# Loop through each subnet and run nmap
for subnet in "${subnets[@]}"
do
    IP_prefix=${subnet%%/*}
    filename=nmap_output_${IP_prefix}_${current_time}

    echo "Running ping scan on subnet $subnet"
    output=$(./performPingScan.sh "$subnet")
    echo $output > outputs/${filename}
done
