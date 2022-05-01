#!/bin/bash

CurrentBrightness=$(xrandr --verbose --current | grep "$1" -A5 | tail -c5)

if [[ $2 -eq 1 ]]; then
	CurrentBrightness=$(python3 -c "print($CurrentBrightness + 0.1)")
elif [[ $2 -eq 0 ]]; then 
	CurrentBrightness=$(python3 -c "print($CurrentBrightness - 0.1)")
fi

xrandr --output $1 --brightness $CurrentBrightness
