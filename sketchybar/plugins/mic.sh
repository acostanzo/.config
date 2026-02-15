#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# Check if any process has an active audio input assertion
MIC_ACTIVE=$(pmset -g assertions 2>/dev/null | grep -c "audio.*input")

if [ "$MIC_ACTIVE" -gt 0 ]; then
  sketchybar --set "$NAME" \
    icon=$ICON_MIC \
    icon.color=$RED \
    drawing=on
else
  sketchybar --set "$NAME" \
    icon=$ICON_MIC_OFF \
    icon.color=$OVERLAY0 \
    drawing=off
fi
