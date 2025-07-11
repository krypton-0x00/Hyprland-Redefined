#!/usr/bin/env bash
# Generate color section for cava config from pywal palette
json="$HOME/.cache/wal/colors.json"
conf="$HOME/.config/cava/config"

if ! command -v jq >/dev/null; then
  echo "jq required" >&2; exit 1; fi

hex() { jq -r "$1" "$json" | sed 's/#//'; }

# pick some colours
fg=$(hex .special.foreground)
bg=$(hex .special.background)
c1=$(hex .colors.color1)
c2=$(hex .colors.color2)
c3=$(hex .colors.color3)

# Remove any existing [color] block we generated earlier
sed -i '/# Pywal-colors-start/,/# Pywal-colors-end/d' "$conf"

cat >> "$conf" <<EOF
# Pywal-colors-start (auto-generated)
[color]
background = "$bg"
foreground = "$fg"
# enable gradient across bars
gradient = 1
gradient_color_1 = "$c1"
gradient_color_2 = "$c2"
gradient_color_3 = "$c3"
# Pywal-colors-end
EOF

echo "Updated cava colors"
