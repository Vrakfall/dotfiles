#!/bin/bash

# Get the first HDMI display
DISPLAY_HDMI0=$(xrandr -q | sed -n 's/\(^HDMI-[0-9]\(-[0-9]\)\?\) connected.*/\1/p')
# Get the first DVI display
DISPLAY_DVI0=$(xrandr -q | sed -n 's/\(^DVI-I\(-[0-9]\)\?\) connected.*/\1/p')

# Place the displays correctly
# TODO Place the DVI one a bit lower
xrandr --output $DISPLAY_HDMI0 --primary --output $DISPLAY_DVI0 --right-of $DISPLAY_HDMI0

setxkbmap be
test -f /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part1-normal.xkb && xkbcomp -i 11 /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part1-normal.xkb $DISPLAY
test -f /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part2-normal-no-caps-lock.xkb && xkbcomp -i 12 /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part2-normal-no-caps-lock.xkb $DISPLAY
