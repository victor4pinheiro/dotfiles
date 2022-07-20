# Network
network=$(ip addr show | awk '/inet.*brd/{print $NF; exit}')

if test -z "$network" 
then
      echo "Not connected"
else
      echo " $network"
fi
