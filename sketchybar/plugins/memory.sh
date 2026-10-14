#!/usr/bin/env sh

# Reports memory the way Activity Monitor's "Memory Used" does: active + wired
# + compressed pages over hw.memsize. The page size is read from vm_stat rather
# than assumed, since it is 16K on Apple Silicon and 4K on Intel.

STAT=$(vm_stat)
PAGE=$(printf '%s\n' "$STAT" | sed -n 's/.*page size of \([0-9]*\).*/\1/p')

USED=$(printf '%s\n' "$STAT" | awk -v page="$PAGE" -v total="$(sysctl -n hw.memsize)" '
  /Pages active/                 { a = $3 }
  /Pages wired down/             { w = $4 }
  /Pages occupied by compressor/ { c = $5 }
  END {
    gsub("\\.", "", a); gsub("\\.", "", w); gsub("\\.", "", c)
    printf "%d", ((a + w + c) * page / total) * 100
  }')

# Thresholds are higher than the cpu ones, since memory sits well above idle
if [ "$USED" -ge 90 ]; then
  COLOR=0xffed8796 # RED
elif [ "$USED" -ge 75 ]; then
  COLOR=0xfff5a97f # ORANGE
elif [ "$USED" -ge 60 ]; then
  COLOR=0xffeed49f # YELLOW
else
  COLOR=0xffcad3f5 # WHITE
fi

sketchybar --set "$NAME" label="${USED}%" label.color="$COLOR"
