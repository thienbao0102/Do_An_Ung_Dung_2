import json
from functools import lru_cache
from pathlib import Path

import pandas as pd
from flask import jsonify
from joblib import load


BACKEND_DIR = Path(__file__).resolve().parent.parent
MODEL_DIR = BACKEND_DIR / "models"
COLUMN_DIR = BACKEND_DIR / "Column_Trains"


@lru_cache(maxsize=3)
def _load_model(version):
    return load(MODEL_DIR / f"finalized_model_v{version}.pkl")


@lru_cache(maxsize=3)
def _load_train_columns(version):
    with (COLUMN_DIR / f"train_columns{version}.json").open(
        "r", encoding="utf-8"
    ) as file:
        return json.load(file)


def PredictScore(data, version):
    if version < 1:
        raise ValueError("version must be greater than zero.")

    name_column = data.pop("name") if "name" in data.columns else None
    train_columns = _load_train_columns(version)
    model = _load_model(version)

    prepared_data = pd.get_dummies(data, drop_first=True)
    prepared_data = prepared_data.reindex(columns=train_columns, fill_value=0)
    predictions = model.predict(prepared_data)

    result = pd.DataFrame(
        {
            "name": (
                name_column
                if name_column is not None
                else [None] * len(predictions)
            ),
            "prediction": predictions,
        }
    )
    result["originalIndex"] = range(len(result))
    return jsonify(result.to_dict(orient="records"))


def count_models():
    return len(list(MODEL_DIR.glob("finalized_model_v*.pkl")))
