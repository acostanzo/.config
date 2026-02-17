#!/bin/bash

# Register aerospace mode change event
sketchybar --add event aerospace_mode_change

# Mode indicator: shows current aerospace binding mode (inside spaces bracket)
sketchybar --add item aerospace_mode left \
           --set aerospace_mode \
             icon.drawing=off \
             label.font="JetBrainsMono Nerd Font:ExtraBold:14.0" \
             label.color=$CRUST \
             label="MAIN" \
             label.padding_left=8 \
             label.padding_right=8 \
             background.drawing=on \
             background.color=$GREEN \
             background.corner_radius=12 \
             background.height=22 \
             script="$PLUGIN_DIR/mode.sh" \
           --subscribe aerospace_mode aerospace_mode_change
