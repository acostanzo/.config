#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# Check WiFi first
WIFI_IP=$(ipconfig getifaddr en0 2>/dev/null)

if [ -n "$WIFI_IP" ]; then
  sketchybar --set "$NAME" icon=$ICON_WIFI icon.color=$SKY label="WiFi"
  exit 0
fi

# Check common ethernet interfaces
for iface in en1 en2 en3 en4 en5 en6 en7 en8; do
  ETH_IP=$(ipconfig getifaddr "$iface" 2>/dev/null)
  if [ -n "$ETH_IP" ]; then
    sketchybar --set "$NAME" icon="󰈀" icon.color=$SKY label="Ethernet"
    exit 0
  fi
done

# Offline
sketchybar --set "$NAME" icon=$ICON_WIFI_OFF icon.color=$RED label="Offline"
