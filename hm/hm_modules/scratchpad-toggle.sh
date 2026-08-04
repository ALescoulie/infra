#!/usr/bin/env bash

set -euo pipefail

if ! swaymsg -t get_tree |
    jq -e '.. | objects | select(.app_id? == "scratchpad")' >/dev/null
then
    kitty --class scratchpad &
    # Give Sway a moment to map the new window.
    sleep 0.15
fi

exec swaymsg scratchpad show

