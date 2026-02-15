#!/bin/bash

sketchybar --add item front_app left \
           --set front_app \
             icon.drawing=off \
             label.font="Hack Nerd Font:Bold:13.0" \
             label.color=$TEXT \
             label.max_chars=30 \
             script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
