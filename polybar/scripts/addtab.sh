#!/bin/bash

deadtabs=$(herbstclient tag_status | grep -oP ".[0-9a-zA-Z][^\t]+")

for tag in $deadtabs; do
	length=${#tag}
	if [[ ${tag:0:1} == *.* ]]; then
		herbstclient merge_tag ${tag:1:${length}}
	fi
done

input=$(zenity --entry)
herbstclient add $input 
wait
herbstclient use $input


