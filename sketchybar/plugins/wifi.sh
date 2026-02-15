#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

update_wifi() {
  IP=$(ipconfig getifaddr en0 2>/dev/null)

  if [ -z "$IP" ]; then
    sketchybar --set "$NAME" \
      icon=$ICON_WIFI_OFF \
      icon.color=$OVERLAY0 \
      label="Off"
  else
    sketchybar --set "$NAME" \
      icon=$ICON_WIFI \
      icon.color=$SKY \
      label="On"
  fi
}

show_popup() {
  IP=$(ipconfig getifaddr en0 2>/dev/null || echo "N/A")
  sketchybar --set "$NAME" popup.drawing=toggle
  sketchybar --remove '/wifi.popup\..*/' 2>/dev/null

  sketchybar --add item wifi.popup.ip popup."$NAME" \
             --set wifi.popup.ip \
               icon="IP:" \
               icon.color=$SKY \
               label="$IP"
}

case "$SENDER" in
  "wifi_change") update_wifi ;;
  "mouse.clicked") show_popup ;;
  *) update_wifi ;;
esac
