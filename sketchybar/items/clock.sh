#!/bin/bash

sketchybar --add item clock right \
           --set clock \
             icon=$ICON_CLOCK \
             icon.color=$PEACH \
             label.padding_right=8 \
             update_freq=30 \
             script="$PLUGIN_DIR/clock.sh"
