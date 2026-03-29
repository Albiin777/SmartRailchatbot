FROM python:3.10.11-slim

WORKDIR /app

# Install system dependencies required by Rasa components
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Copy local files
COPY . /app

# Upgrade pip and install the requirements
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Remove old models and retrain the bot
RUN rm -rf models/*
RUN rasa train

# Expose necessary ports
EXPOSE 5005 5055

# Run the action server in the background and start the rasa API
CMD sh -c "rasa run actions --port 5055 & rasa run --enable-api --cors \"*\" --port ${PORT:-5005} --endpoints endpoints.yml"