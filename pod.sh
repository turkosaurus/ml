#!/usr/bin/env bash

CONTAINER_NAME="python-jupyter"
IMAGE_NAME="python-jupyter"

# Require podman.
if ! command -v podman &> /dev/null; then
    echo "error: podman not found, install to continue."
    exit 1
fi

# Check if the container exists.
if ! podman ps -a --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "$CONTAINER_NAME: does not exist. Creating..."
    podman create --name "${CONTAINER_NAME}" "${IMAGE_NAME}"
fi

# Start the container if it's not running.
if ! podman ps --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "$CONTAINER_NAME: not running. Starting..."
    podman start "${CONTAINER_NAME}"
fi

# Enter the container's interactive shell.
echo "$CONTAINER_NAME: opening shell..."
podman exec -it "${CONTAINER_NAME}" /bin/bash
