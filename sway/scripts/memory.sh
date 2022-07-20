#!/bin/sh

# Memory

ramusage=$(free | awk '/Mem/{printf("RAM Usage: %.2f\n"), $3/$2*100}'| awk '{print $3}' | cut -d. -f1)

echo " $ramusage%"
