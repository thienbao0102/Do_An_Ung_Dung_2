from joblib import load
import pandas as pd
from flask import Flask, request, jsonify
import json

model = load('finalized_model.pkl')

def PredictScore(data):
    print(data)
    # xử lý tách cột name nếu có
    name_column = 'name'
    columnName = None
    if name_column in data.columns:
        columnName = data.pop(name_column)

    # xử lý dữ liệu để predict
    data = pd.get_dummies(data,drop_first=True)
    with open("train_columns.json", "r") as f:
        train_columns = json.load(f)
    data = data.reindex(columns=train_columns, fill_value=0)
    print(data.columns)
    # Thực hiện dự đoán
    predictions = model.predict(data)
    
    # xử lý dữ liệu trả về
    result = pd.DataFrame({
        'name': columnName if columnName is not None else [None] * len(predictions),
        'prediction': predictions
    })
    print("result")
    print(result)
    # Trả kết quả
    return jsonify(result.to_dict(orient='records'))  # Chuyển kết quả về JSON
# hàm xử lý fit model
# def FitModel(data):
