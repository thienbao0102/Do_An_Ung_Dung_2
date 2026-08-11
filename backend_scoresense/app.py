import os

import pandas as pd
from flask import Flask, jsonify, request
from flask_cors import CORS

from handelRequest.handelApi import PredictScore, count_models


def _allowed_origins():
    configured_origins = os.getenv(
        "ALLOWED_ORIGINS",
        "http://localhost:5000,http://127.0.0.1:5000",
    )
    return [
        origin.strip()
        for origin in configured_origins.split(",")
        if origin.strip()
    ]


app = Flask("scoresense")
app.config["MAX_CONTENT_LENGTH"] = 10 * 1024 * 1024
CORS(app, resources={r"/*": {"origins": _allowed_origins()}})


@app.get("/health")
def health():
    return jsonify(status="ok")


@app.post("/predict")
def predict():
    payload = request.get_json(silent=True)
    if not isinstance(payload, dict):
        return jsonify(error="Request body must be a JSON object."), 400

    input_data = payload.get("inputDataImport")
    if (
        not isinstance(input_data, list)
        or len(input_data) < 2
        or not isinstance(input_data[0], list)
        or not input_data[0]
    ):
        return jsonify(error="inputDataImport must contain a header and data rows."), 400

    try:
        version = int(payload.get("version", 1))
    except (TypeError, ValueError):
        return jsonify(error="version must be an integer."), 400

    try:
        frame = pd.DataFrame(input_data[1:], columns=input_data[0])
        return PredictScore(frame, version)
    except FileNotFoundError:
        return jsonify(error=f"Model version {version} does not exist."), 404
    except (TypeError, ValueError) as error:
        return jsonify(error=str(error)), 400


@app.get("/totalmodel")
def total_model():
    return jsonify(numModel=count_models() + 1)


@app.errorhandler(413)
def request_too_large(_error):
    return jsonify(error="Request body exceeds the 10 MB limit."), 413


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=int(os.getenv("PORT", "5000")),
        debug=False,
        use_reloader=False,
    )
