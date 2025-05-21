#!/usr/bin/env bash

CONTAINER_NAME="python-jupyter"
IMAGE_NAME="python-jupyter"

# Check if the container exists.
if ! podman ps -a --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "Container does not exist. Creating it..."
    podman create --name "${CONTAINER_NAME}" "${IMAGE_NAME}"
fi

# Start the container if it's not running.
if ! podman ps --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "Starting the container..."
    podman start "${CONTAINER_NAME}"
fi

# Enter the container's interactive shell.
echo "Entering the container's shell..."
podman exec -it "${CONTAINER_NAME}" /bin/bash
