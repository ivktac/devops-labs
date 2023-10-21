#!/bin/bash

while getopts ":p:s:" opt; do
  case $opt in
    p) DIRECTORY="$OPTARG" ;;
    s) TEXT="$OPTARG" ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$DIRECTORY" ] || [ -z "$TEXT" ]; then
  echo "Usage: $0 -p [directory] -s [text]"
  echo "Example: $0 -p /home/user/Downloads/ -s 'search text'"
  exit 1
fi

if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory $DIRECTORY does not exist."
  exit 1
fi

if command -v rg >/dev/null 2>&1; then
  rg -H -I "$TEXT" "$DIRECTORY"
else
  grep -r "$TEXT" "$DIRECTORY"
fi
