#!/bin/bash

# if exists docker use instead of podman
if command -v docker &> /dev/null
then
    echo "docker exists"
    alias podman=docker
fi

podman build -t my-java-app .

podman run my-java-app
