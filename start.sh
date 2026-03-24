#!/bin/sh
set -e
# Only train if models/ is empty (optional, for low memory)
if [ -z "$(ls -A models 2>/dev/null)" ]; then
  rasa train
fi
rasa run --enable-api --cors "*" --port $PORT