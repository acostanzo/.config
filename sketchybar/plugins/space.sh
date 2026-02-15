#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Extract the workspace number from the item name (space.1 -> 1)
SID="${NAME##*.}"

if [ "$SID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    icon.color=$BASE \
    background.color=$YELLOW \
    background.drawing=on
else
  sketchybar --set "$NAME" \
    icon.color=$OVERLAY0 \
    background.color=$TRANSPARENT \
    background.drawing=off
fi
