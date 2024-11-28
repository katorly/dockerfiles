#!/bin/bash

# This script adds a feature to automatically disconnect the VNC server
# after exiting the JetBrains IDE, instead of showing a blank page.

start_ide() {
    export DISPLAY=:1
    /opt/webstorm/bin/webstorm &
    IDE_PID=$!
}

start_vnc() {
    vncserver :1 -geometry 1280x800 -depth 24
    /opt/noVNC/utils/websockify/run --web /opt/noVNC 6081 localhost:5901 &
    WEBSOCKIFY_PID=$!
}

stop_vnc() {
    vncserver -kill :1
    kill $WEBSOCKIFY_PID
}

start_vnc
start_ide

# Monitor JetBrains IDE process
while true; do
    if ! kill -0 $IDE_PID > /dev/null 2>&1; then
        echo "JetBrains IDE has exited. Stopping VNC server and noVNC."
        stop_vnc
        start_vnc
        start_ide
    fi
    sleep 1
done