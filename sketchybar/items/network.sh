#!/bin/bash

sketchybar --add item network right \
           --set network \
             icon=$ICON_WIFI \
             icon.color=$SKY \
             update_freq=10 \
             script="$PLUGIN_DIR/network.sh"
