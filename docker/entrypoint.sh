#!/bin/bash
set -e

# Remove server.pid to prevent "Address already in use" error on restart
rm -f /app/tmp/pids/server.pid

# Run yarn install if node_modules is empty
if [ ! -d "/app/node_modules/.bin" ]; then
  echo "Running yarn install..."
  yarn install
fi

exec "$@"
