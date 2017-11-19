#! /bin/bash
# This brings the desired `bspwm` desktop to the focused monitor
#
# In sxhkdrc call it with (for example)
# alt + {1-9,0}
#     summondesktop.sh {1-9,0}
# Don't forget to call them by their name

# The desktop to summon
WANTED_DESKTOP=$(bspc query -D -d "$1")
# The monitor of the desktop to summon
WANTED_DESKTOP_MONITOR=$(bspc query -M -d "$WANTED_DESKTOP")
# The desktop currently focused
FOCUSED_MONITOR=$(bspc query -D -d focused)

# If the wanted desktop isn't the one currently focused
if [[ $FOCUSED_MONITOR != $WANTED_DESKTOP ]]; then
  # If it belongs to the currently focused monitor
  if [[ $WANTED_DESKTOP_MONITOR == $FOCUSED_MONITOR ]]; then
    # Just focus it
    bspc desktop $WANTED_DESKTOP --focus
  # Else if the wanted desktop's monitor isn't the last one of that monitor
  elif [[ $(bspc query -D -m $WANTED_DESKTOP_MONITOR | wc -l) -gt 1 ]]; then
    # Then pull & focus it
    bspc desktop $WANTED_DESKTOP --to-monitor focused
    bspc desktop $WANTED_DESKTOP --focus
    # And re-order the Desktops
    bspc monitor -o $(bspc query -D -m focused | sort -n)
  else
    # Swap it with this one
    bspc desktop $WANTED_DESKTOP --swap $FOCUSED_MONITOR
    # bspc desktop $T --activate

    # Then sort the desktops.
    # TODO: Check if it's not easier to sort them all at once
    bspc monitor -o $(bspc query -D -m ^1 | sort -n)
    bspc monitor -o $(bspc query -D -m ^2 | sort -n)
  fi
fi
