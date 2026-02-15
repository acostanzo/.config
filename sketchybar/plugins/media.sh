#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.artist + " — " + .title')"
  sketchybar --set "$NAME" \
    drawing=on \
    icon=$ICON_MEDIA_PLAY \
    label="$MEDIA"
elif [ "$STATE" = "paused" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.artist + " — " + .title')"
  sketchybar --set "$NAME" \
    drawing=on \
    icon=$ICON_MEDIA_PAUSE \
    label="$MEDIA"
else
  sketchybar --set "$NAME" drawing=off
fi
