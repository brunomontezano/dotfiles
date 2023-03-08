#!/bin/bash

picom &
feh --bg-scale ~/img/wallpaper.jpg &
dwmblocks &
aoc_monitor &
xset r rate 300 50 &
redshift -l -31.8:-52.3 -t 4500:3000 -b 1.0:1.0 -g 0.8 -m randr &
