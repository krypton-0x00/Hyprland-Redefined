#!/bin/bash
text=$(xclip -selection clipboard -o)
escaped=$(echo "$text" | jq -sRr @uri)
mpv "https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$escaped&tl=ar"

