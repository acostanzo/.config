#!/bin/bash

sketchybar --add item mic right \
           --set mic \
             icon=$ICON_MIC_OFF \
             icon.color=$OVERLAY0 \
             label.drawing=off \
             update_freq=5 \
             script="$PLUGIN_DIR/mic.sh"
