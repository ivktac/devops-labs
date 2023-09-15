#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 [directory] [extension]"
  echo "Example: $0 /home/user/Downloads/ pdf"
  exit 1
fi

DIRECTORY="$1"
EXTENSION="$2"

if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory $DIRECTORY does not exist."
  exit 1
fi

if command -v fd >/dev/null 2>&1; then
  fd -e "$EXTENSION" -H -I "$DIRECTORY" | wc -l
else
  find "$DIRECTORY" -type f -name "*.$EXTENSION" | wc -l
fi