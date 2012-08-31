#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources
urxvtd -q -f -o
numlockx &
compton -cCGbf -o 0.75 -t 0.02 -l 0.02 -r 2.5
urxvt -e finch &

 exec ck-launch-session dbus-launch awesome
# ...or the Window Manager of your choice
