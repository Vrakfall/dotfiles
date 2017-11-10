#!/bin/bash
xrandr --output HDMI-4 --primary --output DVI-I-1 --right-of HDMI-4

setxkbmap be
test -f /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part1-normal.xkb && xkbcomp -i 11 /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part1-normal.xkb $DISPLAY
test -f /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part2-normal-no-caps-lock.xkb && xkbcomp -i 12 /usr/share/X11/xkb/keymaps/xorg/zboard-merc-part2-normal-no-caps-lock.xkb $DISPLAY
touch /home/vrakfall/ping
