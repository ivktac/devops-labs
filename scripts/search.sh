#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 [directory] [text]"
  echo "Example: $0 /home/user/Downloads/ 'search text'"
  exit 1
fi

DIRECTORY="$1"
TEXT="$2"

if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory $DIRECTORY does not exist."
  exit 1
fi

if command -v rg >/dev/null 2>&1; then
  rg -H -I "$TEXT" "$DIRECTORY"
else
  grep -r "$TEXT" "$DIRECTORY"
fi
