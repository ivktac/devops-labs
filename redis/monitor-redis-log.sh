#!/bin/bash

LOGFILE=/var/log/redis/redis-server.log
TMPFILE=/var/log/redis-server.log

if [ ! -f "$TMPFILE" ]; then
  touch "$TMPFILE"
fi

if [ ! -f "$LOGFILE" ]; then
  echo "Redis log file not found!"
  exit 1
fi

checksum1=$(md5sum $LOGFILE | awk '{ print $1 }')
cheksum2=$(cat $TMPFILE | grep -o '^[^ ]*')

if [ "$checksum1" != "$checksum2" ]; then
  echo "$checksum1 $(date)" >> "$TMPFILE"
  cat "$TMPFILE"
fi
