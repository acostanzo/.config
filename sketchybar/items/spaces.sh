#!/bin/bash

# Register aerospace event
sketchybar --add event aerospace_workspace_change

# AeroSpace workspace indicators (1-9)
SPACE_SIDS=(1 2 3 4 5 6 7 8 9)

for sid in "${SPACE_SIDS[@]}"; do
  sketchybar --add item space.$sid left \
             --set space.$sid \
               icon=$sid \
               icon.font="Hack Nerd Font:Bold:14.0" \
               icon.padding_left=8 \
               icon.padding_right=8 \
               icon.color=$OVERLAY0 \
               label.drawing=off \
               background.color=$TRANSPARENT \
               background.corner_radius=8 \
               background.height=24 \
               background.drawing=off \
               script="$PLUGIN_DIR/space.sh" \
               click_script="aerospace workspace $sid && sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$sid" \
             --subscribe space.$sid aerospace_workspace_change
done

sketchybar --add item space_separator left \
           --set space_separator \
             icon.drawing=off \
             label.drawing=off \
             padding_left=4 \
             padding_right=4
