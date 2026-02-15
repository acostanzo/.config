#!/bin/bash

MEMORY=$(memory_pressure 2>/dev/null | grep "System-wide memory free percentage:" | awk '{gsub(/%/, "", $5); printf "%.0f", 100 - $5}')

if [ -z "$MEMORY" ]; then
  MEMORY=0
fi

sketchybar --set "$NAME" label="${MEMORY}%"
