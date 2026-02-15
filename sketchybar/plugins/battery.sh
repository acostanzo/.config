#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

BATTERY_INFO=$(pmset -g batt)
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | head -1 | tr -d '%')
CHARGING=$(echo "$BATTERY_INFO" | grep -c "AC Power")

if [ "$CHARGING" -gt 0 ]; then
  ICON=$ICON_BATTERY_CHARGING
  COLOR=$GREEN
elif [ "$PERCENTAGE" -gt 60 ]; then
  ICON=$ICON_BATTERY_100
  COLOR=$GREEN
elif [ "$PERCENTAGE" -gt 40 ]; then
  ICON=$ICON_BATTERY_75
  COLOR=$GREEN
elif [ "$PERCENTAGE" -gt 20 ]; then
  ICON=$ICON_BATTERY_50
  COLOR=$YELLOW
elif [ "$PERCENTAGE" -gt 5 ]; then
  ICON=$ICON_BATTERY_25
  COLOR=$RED
else
  ICON=$ICON_BATTERY_0
  COLOR=$RED
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%"
