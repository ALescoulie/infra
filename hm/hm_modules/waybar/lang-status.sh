#!/usr/bin/env bash

current_im=$(fcitx5-remote -n 2>/dev/null)

case "$current_im" in
  "keyboard-us")
    echo "{\"text\": \"EN\", \"tooltip\": \"English (US)\", \"class\": \"keyboard-us\"}"
    ;;
  "keyboard-us-intl")
    echo "{\"text\": \"INTL\", \"tooltip\": \"English (US, International)\", \"class\": \"keyboard-us-intl\"}"
    ;;
  "pinyin")
    echo "{\"text\": \"漢字\", \"tooltip\": \"Pinyin\", \"class\": \"pinyin\"}"
    ;;
  *)
    echo "{\"text\": \"?\", \"tooltip\": \"$current_im\", \"class\": \"unknown\"}"
    ;;
esac

