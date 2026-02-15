#!/bin/bash

# Register aerospace event
sketchybar --add event aerospace_workspace_change

# Create slot items for up to 15 workspaces (hidden by default)
for i in $(seq 0 14); do
  sketchybar --add item space.slot.$i left \
             --set space.slot.$i \
               icon="" \
               icon.font="JetBrains Mono Nerd Font:Bold:15.0" \
               icon.y_offset=0 \
               icon.padding_left=8 \
               icon.padding_right=8 \
               icon.color=$OVERLAY0 \
               label.drawing=off \
               background.drawing=off \
               drawing=off
done

# Only slot.0 subscribes and runs the script to update all slots
sketchybar --set space.slot.0 \
             script="$PLUGIN_DIR/space.sh" \
           --subscribe space.slot.0 aerospace_workspace_change front_app_switched

sketchybar --add item space_separator left \
           --set space_separator \
             icon.drawing=off \
             label.drawing=off \
             padding_left=4 \
             padding_right=4
