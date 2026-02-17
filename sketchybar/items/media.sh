#!/bin/bash

sketchybar --add item media center \
           --set media \
             icon=$ICON_MEDIA \
             icon.color=$MAUVE \
             icon.font="JetBrainsMono Nerd Font:Bold:17.0" \
             label.color=$TEXT \
             label.max_chars=40 \
             scroll_texts=on \
             drawing=off \
             background.color=$ITEM_BG \
             background.corner_radius=10 \
             background.height=28 \
             background.drawing=on \
             script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
