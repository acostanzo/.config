#!/bin/bash

sketchybar --add item volume right \
           --set volume \
             icon=$ICON_VOLUME_HIGH \
             icon.color=$LAVENDER \
             script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change
