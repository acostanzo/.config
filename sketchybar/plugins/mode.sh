#!/bin/bash

source "$CONFIG_DIR/colors.sh"

MODE=$(aerospace list-modes --current 2>/dev/null)
LABEL=$(echo "${MODE:-main}" | tr '[:lower:]' '[:upper:]')

if [ "$MODE" = "main" ] || [ -z "$MODE" ]; then
  BG=$GREEN
else
  BG=$RED
fi

sketchybar --set "$NAME" label="$LABEL" background.color="$BG"
