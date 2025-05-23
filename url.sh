#!/usr/bin/env bash

JUPYTER_URL=$(podman exec -it python-jupyter \
    jupyter notebook list \
    | grep http \
    | awk '{print $1}' \
    | sed -E 's#http://[^:]*:#http://localhost:#'
)

if [ -z "$JUPYTER_URL" ]; then
    echo "error: Jupyter URL not found."
    exit 1
else
    echo "Jupyter URL: $JUPYTER_URL"
    echo "Opening Jupyter Notebook in browser..."
    xdg-open "$JUPYTER_URL" &> /dev/null
    if [ $? -ne 0 ]; then
        echo "error: failed to open browser."
        exit 1
    fi
fi


