#!/bin/bash

sketchybar --add item tailscale right \
           --set tailscale \
             icon=$ICON_VPN \
             icon.color=$GREEN \
             label="TS" \
             update_freq=30 \
             script="$PLUGIN_DIR/tailscale.sh" \
           --subscribe tailscale mouse.clicked
