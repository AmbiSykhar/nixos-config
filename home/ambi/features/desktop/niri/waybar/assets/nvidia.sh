#!/run/current-system/sw/bin/bash

UTILIZATION=$(/run/current-system/sw/bin/nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
# echo $UTILIZATION
MODEL=$(/run/current-system/sw/bin/nvidia-smi --query-gpu=name --format=csv,noheader | /run/current-system/sw/bin/awk '{print $3 " " $4}')
TEMPERATURE=$(/run/current-system/sw/bin/nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
USED=$(/run/current-system/sw/bin/nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
TOTAL=$(/run/current-system/sw/bin/nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits)
USAGE=$(/run/current-system/sw/bin/awk "BEGIN {printf \"%d\n\", ($USED / $TOTAL * 100) + 0.5}")

if [[ "$UTILIZATION" -ge "95" ]];then
    CLASS="critical"
fi



printf '{"text": "%s", "class": "%s", "alt": "%s"}\n' " $UTILIZATION%" "$CLASS" "$MODEL\nTemp: $TEMPERATURE°\nVRAM: $USAGE%"
