#!/bin/sh
set -e

# Run migrations (optional but safe)
rasa run --enable-api --cors "*" --port ${PORT:-5005}