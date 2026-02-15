#!/bin/bash

sketchybar --add item camera right \
           --set camera \
             icon=$ICON_CAM_OFF \
             icon.color=$OVERLAY0 \
             label.drawing=off \
             update_freq=5 \
             script="$PLUGIN_DIR/camera.sh"
