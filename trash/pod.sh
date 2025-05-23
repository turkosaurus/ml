#!/usr/bin/env bash

CONTAINER_NAME="jupy"
IMAGE_NAME="python-jupyter"

# Require podman.
if ! command -v podman &> /dev/null; then
    echo "error: podman not found, install to continue."
    exit 1
fi

# Check if the container exists.
if ! podman ps -a --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "$CONTAINER_NAME: does not exist. Creating..."
    podman create \
        --rm \
        --name "${CONTAINER_NAME}" \
        --volume "./scripts:/scripts" \
        -p 8888:8888 \
        "${IMAGE_NAME}" \
        tail -f /dev/null
fi

# Start the container if it's not running.
if ! podman ps --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
    echo "$CONTAINER_NAME: not running. Starting..."
    podman start "${CONTAINER_NAME}"
fi

echo "$CONTAINER_NAME: starting jupyter notebook..."
if ! podman exec --detatch "${CONTAINER_NAME}" \
    jupyter notebook \
        --ip=0.0.0.0 \
        --port=8888 \
        --no-browser \
        --allow-root & then 
    echo "error: failed to start jupyter notebook."
else
    echo "jupyter notebook started successfully."
fi

