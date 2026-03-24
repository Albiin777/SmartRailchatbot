# SmartRail Rasa Chatbot

This project contains:

- Rasa bot configuration and training data
- Custom actions in Python
- React + Vite chatbot UI

## Environment Variables

Create a local env file from the template:

```bash
cp .env.example .env
```

Variables used by this project:

- `RASA_ACTION_ENDPOINT_URL`: Action server webhook for Rasa (`endpoints.yml`)
- `SMART_RAIL_API_BASE_URL`: Train API base URL used in `actions/actions.py`
- `VITE_RASA_REST_WEBHOOK_URL`: REST webhook consumed by `src/App.jsx`
- `RASA_ENTERPRISE_API_URL`: Optional Rasa Enterprise URL in `credentials.yml`

For hosting (Railway, Render, etc.), set the same variables in your platform's environment settings.

## Install

```bash
pip install -r requirements.txt
npm install
```

## Run Locally

Terminal 1 (Rasa server):

```bash
rasa train
rasa run --enable-api --cors "*" --port 5005
```

Terminal 2 (Action server):

```bash
rasa run actions --port 5055
```

Terminal 3 (Frontend):

```bash
npm run dev
```
