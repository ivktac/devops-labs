#!/bin/bash

LOGFILE=/var/log/redis/redis-server.log
TMPFILE=/tmp/redis-server.log

if [ ! -f "$TMPFILE" ]; then
  touch "$TMPFILE"
fi

if [ ! -f "$LOGFILE" ]; then
  echo "Redis log file not found!"
  exit 1
fi

checksum1=$(md5sum $LOGFILE)
cheksum2=$(cat $TMPFILE)

if [ "$checksum1" != "$checksum2" ]; then
  echo "$checksum1" > "$TMPFILE"
  echo "Redis log file has changed!"
fi
