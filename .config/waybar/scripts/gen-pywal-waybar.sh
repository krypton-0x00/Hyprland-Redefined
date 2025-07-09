#!/usr/bin/env bash
# Generate Waybar CSS colours from pywal's colours.json and reload Waybar.
# Place this script in ~/.config/waybar/scripts and call it after running 'wal'.

json="$HOME/.cache/wal/colors.json"
out_css="$HOME/.config/waybar/pywal-colors.css"

# Ensure jq is installed
if ! command -v jq >/dev/null; then
  echo "jq not found – install it to enable pywal → waybar colour mapping." >&2
  exit 1
fi

if [ ! -f "$json" ]; then
  echo "pywal colours.json not found at $json" >&2
  exit 1
fi

# Read colours from pywal JSON
a() { jq -r "${2:-.special}.$1" "$json"; }
c() { jq -r ".colors.color$1" "$json"; }

background=$(a background)
foreground=$(a foreground)
color0=$(c 0)
color1=$(c 1)
color2=$(c 2)
color3=$(c 3)
color4=$(c 4)
color5=$(c 5)
color6=$(c 6)
color10=$(c 10)

# Mapping → adjust as you prefer
cat > "$out_css" <<EOF
/* Auto-generated from pywal – $(date) */
@define-color raisin-black $background;
@define-color text $foreground;
@define-color beige $foreground;
@define-color cerise $color4;
@define-color celadon $color10;
@define-color mint $color2;
@define-color foam $color6;
EOF

echo "Generated $out_css"

# Tell Waybar to reload its CSS (requires v0.10.0+)
killall -SIGUSR2 waybar 2>/dev/null || true
