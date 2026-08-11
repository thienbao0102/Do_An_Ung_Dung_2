# ScoreSense VLU deployment

ScoreSense is deployed as two free services:

- Flutter Web on Firebase Hosting.
- Flask API on Render.

Online model training is intentionally disabled. The API serves the three
versioned models committed in `backend_scoresense/models`.

## Backend

Render reads `render.yaml` from the repository root. The service uses
`backend_scoresense` as its root directory, installs `requirements.txt`, and
starts the API with Gunicorn.

Required environment variable:

```text
ALLOWED_ORIGINS=https://scoresense-vlu.web.app,https://scoresense-vlu.firebaseapp.com
```

## Frontend

Build Flutter with the public Render API URL:

```text
flutter build web --release --dart-define=API_BASE_URL=https://scoresense-vlu-api.onrender.com
```

From `scoresense`, deploy the generated `build/web` directory:

```text
firebase deploy --only hosting
```

The Firebase SPA rewrite is defined in `scoresense/firebase.json`.
