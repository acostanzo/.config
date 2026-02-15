#!/bin/bash

sketchybar --add item memory right \
           --set memory \
             icon=$ICON_MEMORY \
             icon.color=$SAPPHIRE \
             update_freq=5 \
             script="$PLUGIN_DIR/memory.sh"
