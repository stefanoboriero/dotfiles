#!/usr/bin/env sh

# Labels here are driven by helper/cpu.h over the mach helper, not by a script.
# The bar is vertical, so the icon is a separate stacked item (see memory.sh)
# and the graphs stay off: they are 55pt wide and the bar is only 50pt.

sketchybar --add item        cpu.top right                  \
           --set cpu.top     label.font="$FONT:Regular:7"   \
                             label=CPU                      \
                             icon.drawing=off               \
                             width=15                       \
                             background.padding_right=23    \
                             drawing=off                    \
                                                            \
           --add item        cpu.percent right              \
           --set cpu.percent label.font="$FONT:Bold:12"      \
                             label=CPU                      \
                             label.width=$CONTENT_WIDTH     \
                             label.align=center             \
                             label.padding_left=0           \
                             label.padding_right=0          \
                             icon.drawing=off               \
                             update_freq=2                  \
                             mach_helper="$HELPER"          \
                                                            \
           --add item        cpu.icon right                 \
           --set cpu.icon    icon=$CPU                      \
                             icon.font="$FONT:Regular:14.0" \
                             icon.color=$BLUE               \
                             icon.width=$CONTENT_WIDTH      \
                             icon.align=center              \
                             icon.padding_left=0            \
                             icon.padding_right=0           \
                             label.drawing=off              \
                                                            \
           --add graph       cpu.sys right 55               \
           --set cpu.sys     width=0                        \
                             graph.color=$RED               \
                             graph.fill_color=$RED          \
                             label.drawing=off              \
                             icon.drawing=off               \
                             drawing=off                    \
                             background.padding_right=10    \
                             background.padding_left=10     \
                             background.height=30           \
                             background.color=$TRANSPARENT  \
                                                            \
           --add graph       cpu.user right 55              \
           --set cpu.user    graph.color=$BLUE              \
                             label.drawing=off              \
                             icon.drawing=off               \
                             drawing=off                    \
                             background.padding_right=10    \
                             background.padding_left=10     \
                             background.height=30           \
                             background.color=$TRANSPARENT
