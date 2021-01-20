#!/bin/bash
devId=$(cat /data/options.json | grep '"id":' | grep -P -o '(?<="id": ")[\s\S]*(?="$)')

echo "Proceeding with '$devId' as ID"
echo
echo "Press the clock button on the thermostat when you get the following message:"
echo "'libetrv.device:connect:54 - Trying connect to $devId'"

sleep 5

echo "Starting"

python3 -m libetrv.cli device --device-id $devId retrieve_key

echo "stopping"
