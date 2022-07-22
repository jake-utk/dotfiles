#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar --reload main --log=error &


# for i in /sys/class/hwmon/hwmon*/temp*_input; do 
#     if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
#         export HWMON_PATH="$i"
#     fi
# done