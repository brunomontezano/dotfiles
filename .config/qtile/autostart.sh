#!/bin/sh
picom -b --config ~/.config/picom/picom.conf &
xset r rate 300 50 &
redshift -l -31.8:-52.3 -t 5700:3600 -g 0.8 -m randr &
