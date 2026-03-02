#!/bin/bash
sleep 3

# Kill any stale instances
vncserver -kill :1 2>/dev/null || true
pkill -f novnc 2>/dev/null || true
pkill -f websockify 2>/dev/null || true

# Clean up lock files
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null || true

# Start fresh
vncserver :1 -geometry 1280x800 -depth 24
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080 --web /usr/share/novnc &
