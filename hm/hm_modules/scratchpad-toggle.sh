##!/usr/bin/env bash
#
#set -euo pipefail
#
#if ! swaymsg -t get_tree |
#    jq -e '.. | objects | select(.app_id? == "scratchpad")' >/dev/null
#then
#    kitty --class scratchpad &
#    # Give Sway a moment to map the new window.
#    sleep 0.3
#fi
#
#
#swaymsg scratchpad show
#
#if swaymsg -t get_tree |
#    jq -e '.. | objects | select(.app_id? == "scratchpad") | select(.visible == true)' >/dev/null
#then
#    swaymsg '[app_id="scratchpad"] resize set 1920 px 1080 px'
#    swaymsg '[app_id="scratchpad"] move position center'
#fi
#

#!/usr/bin/env bash

set -euo pipefail

log="/tmp/scratchpad-debug.log"
echo "--- $(date +%T.%N) toggle invoked ---" >> "$log"

if ! swaymsg -t get_tree |
    jq -e '.. | objects | select(.app_id? == "scratchpad")' >/dev/null
then
    echo "$(date +%T.%N) no existing window found, spawning kitty" >> "$log"
    kitty --class scratchpad &
    echo "$(date +%T.%N) spawned kitty pid $!" >> "$log"
    # Give Sway a moment to map the new window.
    sleep 0.3
else
    echo "$(date +%T.%N) existing window found" >> "$log"
fi

swaymsg scratchpad show

# Sway doesn't reliably keep resize/move geometry applied through repeated
# scratchpad hide/show cycles (see swaywm/sway#8493, #5308, #6561), so force
# it here every time the window actually ends up visible, rather than relying
# on it sticking from window creation.
if swaymsg -t get_tree |
    jq -e '.. | objects | select(.app_id? == "scratchpad") | select(.visible == true)' >/dev/null
then
    swaymsg '[app_id="scratchpad"] resize set 1920 px 1080 px'
    swaymsg '[app_id="scratchpad"] move position center'
fi
