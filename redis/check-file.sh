#!/bin/bash

REDIS_HOST="${REDIS_HOST:-localhost}"
REDIS_PORT="${REDIS_PORT:-6379}"
FILE_PATH="/var/log/my-app.log"
LAST_SIZE_KEY="last_size"
LAST_MODIFIED_TIME_KEY="last_modified_time"

current_size=$(stat -c %s "$FILE_PATH")
current_date=$(stat -c %y "$FILE_PATH")

last_size=$(/usr/local/bin/redis-cli -h $REDIS_HOST -p $REDIS_PORT GET $LAST_SIZE_KEY)
last_modified_time=$(/usr/local/bin/redis-cli -h $REDIS_HOST -p $REDIS_PORT GET $LAST_MODIFIED_TIME_KEY)

if [ "$current_size" != "$last_size" ] || [ "$current_date" != "$last_modified_time" ]; then
  /usr/local/bin/redis-cli -h $REDIS_HOST -p $REDIS_PORT SET $LAST_SIZE_KEY "$current_size"
  /usr/local/bin/redis-cli -h $REDIS_HOST -p $REDIS_PORT SET $LAST_MODIFIED_TIME_KEY "$current_date"
fi
