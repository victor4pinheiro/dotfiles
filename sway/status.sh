#!/bin/sh

# Date and time
date=`$HOME/.config/sway/scripts/date.sh`

# Temperature
temperature=`$HOME/.config/sway/scripts/temperature.sh`

# Memory
memory=`$HOME/.config/sway/scripts/memory.sh`

# CPU
cpu=`$HOME/.config/sway/scripts/cpu.sh`

# Network
network=`$HOME/.config/sway/scripts/network.sh`

echo "$network | $temperature | $memory | $cpu | $date"
