#!/usr/bin/env sh

# Reads Slack's dock badge, which macOS exposes through lsappinfo without
# needing any privacy permission. Slack sets the badge to a bare dot when there
# are unread channel messages, and to a count when there are mentions or DMs.
#
# lsappinfo prints nothing at all when Slack is not running, and no StatusLabel
# key when it is running with no badge, so both collapse to the idle state below.
#
# `-only StatusLabel` stopped returning the key on newer macOS, so read the
# full -long dump and pick the StatusLabel line out of it instead.
#
# The count and the dot are appended to the glyph as one icon string so they sit
# beside it and stay centred. Each state differs in shape as well as colour:
# something is only drawn next to the glyph when there is something waiting.

. "$HOME/.config/sketchybar/icons.sh"
. "$HOME/.config/sketchybar/colors.sh"

BADGE=$(lsappinfo info -long Slack 2>/dev/null \
        | sed -n 's/^"StatusLabel"=.*"label"="\([^"]*\)".*/\1/p' \
        | grep -m1 .)

case "$BADGE" in
  "")
    # Nothing waiting, or Slack is not running: fade right out
    sketchybar --set slack icon="$SLACK" icon.color=$DIM
    ;;
  *[0-9]*)
    # A count means mentions or direct messages, so make it stand out. Every
    # glyph in Hack advances 8.4pt at 14pt, so the glyph plus three characters
    # measures 42pt and still fits the reserve, while a fourth reaches 50pt and
    # would clip. Cap anything longer than two digits at "99+".
    case "$BADGE" in
      ???*) SHOWN="99+" ;;
      *)    SHOWN="$BADGE" ;;
    esac
    sketchybar --set slack icon="$SLACK $SHOWN" icon.color=$RED
    ;;
  *)
    # A dot (or anything else non-numeric): unread channel messages only
    sketchybar --set slack icon="$SLACK $DOT" icon.color=$YELLOW
    ;;
esac
