#!/bin/bash

source "$CONFIG_DIR/icons.sh"

VOLUME="${INFO:-$(osascript -e 'output volume of (get volume settings)')}"
MUTED=$(osascript -e 'output muted of (get volume settings)')

if [ "$MUTED" = "true" ]; then
  ICON=$ICON_VOLUME_MUTE
elif [ "$VOLUME" -ge 60 ] 2>/dev/null; then
  ICON=$ICON_VOLUME_HIGH
elif [ "$VOLUME" -ge 30 ] 2>/dev/null; then
  ICON=$ICON_VOLUME_MID
elif [ "$VOLUME" -ge 1 ] 2>/dev/null; then
  ICON=$ICON_VOLUME_LOW
else
  ICON=$ICON_VOLUME_MUTE
fi

sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%"
