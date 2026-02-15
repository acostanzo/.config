#!/bin/bash

sketchybar --add item cpu right \
           --set cpu \
             icon=$ICON_CPU \
             icon.color=$TEAL \
             update_freq=3 \
             script="$PLUGIN_DIR/cpu.sh"
