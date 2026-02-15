#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# Check if any process has a Video Wake Lock assertion (camera in use)
CAM_ACTIVE=$(pmset -g assertions 2>/dev/null | grep -c "Video Wake Lock")

if [ "$CAM_ACTIVE" -gt 0 ]; then
  sketchybar --set "$NAME" \
    icon=$ICON_CAM \
    icon.color=$RED \
    drawing=on
else
  sketchybar --set "$NAME" \
    icon=$ICON_CAM_OFF \
    icon.color=$OVERLAY0 \
    drawing=off
fi
