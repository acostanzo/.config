#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

TAILSCALE="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

update_tailscale() {
  if [ ! -x "$TAILSCALE" ]; then
    sketchybar --set "$NAME" drawing=off
    return
  fi

  STATUS=$("$TAILSCALE" status --json 2>/dev/null)

  if [ -z "$STATUS" ]; then
    sketchybar --set "$NAME" \
      icon=$ICON_VPN_OFF \
      icon.color=$OVERLAY0 \
      label="Off"
    return
  fi

  ONLINE=$(echo "$STATUS" | jq -r '.Self.Online')
  TAIL_IP=$(echo "$STATUS" | jq -r '.TailscaleIPs[0]')

  if [ "$ONLINE" = "true" ]; then
    sketchybar --set "$NAME" \
      icon=$ICON_VPN \
      icon.color=$GREEN \
      label="TS"
  else
    sketchybar --set "$NAME" \
      icon=$ICON_VPN_OFF \
      icon.color=$OVERLAY0 \
      label="Off"
  fi
}

show_popup() {
  STATUS=$("$TAILSCALE" status --json 2>/dev/null)
  TAIL_IP=$(echo "$STATUS" | jq -r '.TailscaleIPs[0]' 2>/dev/null)
  HOSTNAME=$(echo "$STATUS" | jq -r '.Self.HostName' 2>/dev/null)
  EXIT_NODE=$(echo "$STATUS" | jq -r '.Self.ExitNode // empty' 2>/dev/null)

  sketchybar --set "$NAME" popup.drawing=toggle
  sketchybar --remove '/tailscale.popup\..*/' 2>/dev/null

  sketchybar --add item tailscale.popup.ip popup."$NAME" \
             --set tailscale.popup.ip \
               icon="IP:" \
               icon.color=$GREEN \
               label="${TAIL_IP:-N/A}"

  sketchybar --add item tailscale.popup.host popup."$NAME" \
             --set tailscale.popup.host \
               icon="Host:" \
               icon.color=$GREEN \
               label="${HOSTNAME:-N/A}"
}

case "$SENDER" in
  "mouse.clicked") show_popup ;;
  *) update_tailscale ;;
esac
