#/bin/sh

xrandr --output eDP-1 --off
xrandr --output HDMI-1 --auto --primary
xrandr --output DP-3 --auto --left-of HDMI-1
feh --bg-scale sexy.jpg
echo hello
