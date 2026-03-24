#!/bin/sh
set -e
rasa train
rasa run --enable-api --cors "*" --port $PORT