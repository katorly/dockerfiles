#!/bin/bash

set -e

dockerd --host=unix:///var/run/docker.sock \
    --storage-driver=vfs \
    --log-level=error \
    --log-driver=json-file > /var/log/docker.log 2>&1 &

for i in {1..30}; do
    if docker info >/dev/null 2>&1; then
        break
    fi
    if [ $i -eq 30 ]; then
        echo "Docker daemon failed to start" >&2
        cat /var/log/docker.log >&2
        exit 1
    fi
    sleep 1
done

# Set to `dev` user
if [ $# -eq 0 ]; then
    exec runuser -u dev -- /bin/bash --login
else
    exec runuser -u dev -- /bin/bash --login -c "$(printf '%q ' "$@")"
fi
