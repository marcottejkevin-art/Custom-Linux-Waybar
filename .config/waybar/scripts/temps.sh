#!/bin/bash

cpu_temp="--"
gpu_temp="--"

if command -v sensors >/dev/null 2>&1; then
    cpu_temp=$(sensors 2>/dev/null | awk '
        /Package id 0:/ {
            gsub(/[+°C]/,"",$4)
            print $4
            exit
        }
        /Tctl:/ {
            gsub(/[+°C]/,"",$2)
            print $2
            exit
        }
        /Tdie:/ {
            gsub(/[+°C]/,"",$2)
            print $2
            exit
        }
    ')
fi

if command -v nvidia-smi >/dev/null 2>&1; then
    gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu \
        --format=csv,noheader,nounits 2>/dev/null | head -n1)
fi

if [ "$gpu_temp" = "--" ] || [ -z "$gpu_temp" ]; then
    gpu_temp=$(sensors 2>/dev/null | awk '
        /edge:/ {
            gsub(/[+°C]/,"",$2)
            print $2
            exit
        }
    ')
fi

[ -z "$cpu_temp" ] && cpu_temp="--"
[ -z "$gpu_temp" ] && gpu_temp="--"

echo "CPU ${cpu_temp}°C|GPU ${gpu_temp}°C"
