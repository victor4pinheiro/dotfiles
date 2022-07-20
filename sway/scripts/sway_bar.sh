# Change this according to your device
################
# Variables
################

# Date and time
time=$(date "+%Y/%m/%d %H:%M")

#############
# Commands
#############

# Audio and multimedia

# Temperature
temperature_one=$(cat /sys/class/thermal/thermal_zone*/temp | awk 'NR==1 {print; exit}')
temperature_two=$(cat /sys/class/thermal/thermal_zone*/temp | awk 'NR==2 {print; exit}')
temperature_three=$(cat /sys/class/thermal/thermal_zone*/temp | awk 'NR==3 {print; exit}')

# Network
network=$(ip addr show | awk '/inet.*brd/{print $NF; exit}')

echo "[ -z "$network" ] && echo "Not connected" || echo $network | T1: $temperature_one - T2: $temperature_two - T3: $temperature_three | $time"
