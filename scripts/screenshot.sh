#!/bin/bash

file_name="screenshot_$(date "+%Y-%m-%d_%T").png"
output_dir="$HOME/Pictures/Screenshots"

if [ $# -eq 0 ]; then
        gnome-screenshot -f "$output_dir/$file_name"
fi
