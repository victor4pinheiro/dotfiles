#!/bin/sh
# dark.mode.d/foot.sh
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/foot/foot.ini"
sed -i 's/initial-color-theme=[0-9]*/initial-color-theme=1/' "$CONFIG"

pkill -u "$USER" --signal=SIGUSR1 ^foot$
