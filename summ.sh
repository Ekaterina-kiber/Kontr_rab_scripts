#!/bin/bash
summ=0
if [[ "$1" = "-h" ]]; then
    for var in "${@:2}"; do
        if [[ ! -f $var ]]; then
            echo "no file" >&1
            exit 1
        fi
        mem=$(du --max-depth 0 "$var")
        mem1=${mem%"$var"}
        let  "summ = $summ + $mem1 "

    done
elif [[ "${1:0:1}"!="-" ]]; then
    for var in "$@"; do
        if [[ ! -f $var ]]; then
            echo "no file" >&1
            exit 1
        fi
        mem=$(du --max-depth 0 "$var")
        mem1=${mem%"$var"}
        let  "summ = $summ + $mem1 "

    done
else 
    echo "no command" >&2
    exit 2
fi
if [[ $1 = "-h" ]]; then
    if [[ $summ -gt 1024 ]]; then
        let "summ = $summ/1024"
        echo $summ M
    else 
        echo $summ K
    fi
fi
