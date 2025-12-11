#!/bin/bash

# ------------------------------
# Task Automation Script
# ------------------------------

# 1. Get IP of guvi.in
echo "----- IP Address of guvi.in -----"
nslookup guvi.in
echo

# 2. CPU usage
echo "----- CPU Usage -----"
top -l 1 | grep "CPU usage"
echo

# 3. Memory usage
echo "----- Memory Usage -----"
top -l 1 | grep PhysMem
echo

# 4. Test connectivity to another node (replace with actual IP)
OTHER_NODE_IP="8.8.8.8"
echo "----- Ping $OTHER_NODE_IP -----"
ping -c 4 $OTHER_NODE_IP
echo

# 5. Check if Node.js app is running, start if not
APP_PORT=9000
APP_FILE="app.js"

if ! lsof -i :$APP_PORT > /dev/null; then
  echo "App not running on port $APP_PORT. Starting app..."
  if [ -f $APP_FILE ]; then
    node $APP_FILE &
    sleep 2
    echo "App started."
  else
    echo "Error: $APP_FILE not found!"
  fi
else
  echo "App already running on port $APP_PORT."
fi
echo

# 6. Check if port 9000 is open
echo "----- Check Port $APP_PORT -----"
sudo lsof -i :$APP_PORT
nc -zv localhost $APP_PORT
echo

echo "----- Task Completed -----"

