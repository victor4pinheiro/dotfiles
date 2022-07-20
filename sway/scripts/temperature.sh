#!/bin/sh

# Temperature
temperature=$((`cat /sys/class/thermal/thermal_zone2/temp` / 1000))

if (($temperature >= 70)); then
	echo " $temperature"
elif (($temperature <= 20)); then
	echo " $temperature"
else
	echo " $temperature"
fi