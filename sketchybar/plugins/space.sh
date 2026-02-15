#!/bin/bash

source "$CONFIG_DIR/colors.sh"

MAX_SLOTS=15

# Get occupied workspaces, sorted alphanumerically (numbers first)
OCCUPIED=($(aerospace list-workspaces --monitor all --empty no 2>/dev/null | LC_ALL=C sort))

# Get focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Update slots: show occupied workspaces, hide the rest
for i in $(seq 0 $((MAX_SLOTS - 1))); do
  item="space.slot.$i"

  if [ $i -lt ${#OCCUPIED[@]} ]; then
    ws="${OCCUPIED[$i]}"

    if [ "$ws" = "$FOCUSED" ]; then
      sketchybar --set "$item" \
        drawing=on \
        icon="$ws" \
        icon.color=$YELLOW \
        background.drawing=off
    else
      sketchybar --set "$item" \
        drawing=on \
        icon="$ws" \
        icon.color=$OVERLAY0 \
        background.drawing=off
    fi

    sketchybar --set "$item" \
      click_script="aerospace workspace $ws && sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$ws"
  else
    sketchybar --set "$item" drawing=off
  fi
done
