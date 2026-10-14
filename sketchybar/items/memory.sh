#!/usr/bin/env sh

# The bar is vertical, so icon and label do not fit side by side in its 50pt
# width. They are split into two stacked items instead: with position=right,
# items stack bottom-upwards in the order they are added, so the percentage is
# added first and the icon lands above it.

sketchybar --add item           memory.percent right                      \
           --set memory.percent label.font="$FONT:Bold:12"                \
                                label="--"                               \
                                label.width=$CONTENT_WIDTH               \
                                label.align=center                       \
                                label.padding_left=0                     \
                                label.padding_right=0                    \
                                icon.drawing=off                         \
                                update_freq=5                            \
                                script="$PLUGIN_DIR/memory.sh"           \
                                                                         \
           --add item           memory.icon right                        \
           --set memory.icon    icon=$MEMORY                             \
                                icon.font="$FONT:Regular:14.0"           \
                                icon.color=$MAGENTA                      \
                                icon.width=$CONTENT_WIDTH                \
                                icon.align=center                        \
                                icon.padding_left=0                      \
                                icon.padding_right=0                     \
                                label.drawing=off
