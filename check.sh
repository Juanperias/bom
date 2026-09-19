#!/usr/bin/env bash

total_size=$(wc -c < dist/bom.bin)

if (( total_size > 4096 )); then
	echo "Size ($total_size bytes) is Wrong!"
	exit 1 
fi 

echo "Nice work, see you space cowboy! ($total_size bytes)"
