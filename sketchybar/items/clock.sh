#!/bin/bash

sketchybar --add item clock right \
           --set clock \
             icon=$ICON_CLOCK \
             icon.color=$PEACH \
             update_freq=30 \
             script="$PLUGIN_DIR/clock.sh"
