#!/usr/bin/env sh

# A single item, unlike cpu.sh and memory.sh: the badge is only one or two
# characters, so it fits beside the glyph inside the bar's 50pt width instead of
# needing its own row. The plugin rewrites the whole icon string, appending the
# count or the unread dot to the glyph, which keeps the pair exactly centred
# whatever its length. Splitting it across an icon and a label instead would
# need the reserved width re-divided every time the digit count changed.

sketchybar --add item    slack left                            \
           --set slack   icon=$SLACK                           \
                         icon.font="$FONT:Regular:14.0"        \
                         icon.color=$DIM                       \
                         icon.width=$CONTENT_WIDTH             \
                         icon.align=center                     \
                         icon.padding_left=0                   \
                         icon.padding_right=0                  \
                         label.drawing=off                     \
                         update_freq=10                        \
                         script="$PLUGIN_DIR/slack.sh"          \
                         click_script="open -a Slack"
