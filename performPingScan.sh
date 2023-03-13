#!/bin/bash

IP=$1

# Extract characters up until the first forward slash
IP_prefix=${IP%%/*}
# Get current time in milliseconds
current_time=$(date +%s%3N)
filename=nmap_output_${IP_prefix}_${current_time}

#nmap -sn -n -T5 --min-parallelism 100 $IP -oG outputs/$filename


nmap -sn -n -T5 --min-parallelism 100 $IP -oG - | awk '/Up$/{print $2}'
