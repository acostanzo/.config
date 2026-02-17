#!/bin/bash

sketchybar --add item front_app left \
           --set front_app \
             icon.drawing=off \
             label.font="JetBrainsMono Nerd Font:Bold:14.0" \
             label.color=$TEXT \
             label.max_chars=30 \
             label.padding_left=8 \
             label.padding_right=8 \
             background.color=$ITEM_BG \
             background.corner_radius=14 \
             background.height=28 \
             background.border_width=1 \
             background.border_color=$SURFACE1 \
             background.drawing=on \
             script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
