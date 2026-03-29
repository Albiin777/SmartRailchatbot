#!/bin/sh
set -e

# Start the action server in the background
rasa run actions --port 5055 &

# Only train if models/ is empty (optional, for low memory)
if [ -z "$(ls -A models 2>/dev/null)" ]; then
  echo "No models found, training..."
  rasa train
fi

# Start Rasa server, connect endpoints, bind to public PORT
rasa run --enable-api --cors '*' --port ${PORT:-5005} --endpoints endpoints.yml