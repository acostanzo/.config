#!/bin/bash

# Get the menu bar height from the current main display
MENU_HEIGHT=$(osascript -e 'tell application "System Events" to tell process "Finder" to get item 2 of (get the size of menu bar 1)' 2>/dev/null)

if [ -n "$MENU_HEIGHT" ] && [ "$MENU_HEIGHT" -gt 0 ]; then
  sketchybar --bar height="$MENU_HEIGHT"
fi
