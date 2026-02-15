#!/bin/bash

sketchybar --add item wifi right \
           --set wifi \
             icon=$ICON_WIFI \
             icon.color=$SKY \
             label="WiFi" \
             script="$PLUGIN_DIR/wifi.sh" \
           --subscribe wifi wifi_change mouse.clicked
