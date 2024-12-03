from joblib import load
import pandas as pd
from flask import Flask, request, jsonify
import json
import os



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
    model = load('models/finalized_model.pkl')
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

# hàm xử lý train model
# def TrainModel(data):

#bien can thiet de ho tro loadmodel
folder_path = "models"
models = {index + 1: file for index, file in enumerate(sorted(os.listdir(folder_path))) if file.endswith(".pkl")}

# load model theo version
def loadModel_v(version):
    model_path = os.path.join(folder_path, models[version])

    with open(model_path, 'rb') as f:
        model = load(f)
    
    print(f"Đã load model: {models[version]}")
    return model

# count file model
def count_models():
    try:
        model_extension=".pkl"
        files = os.listdir("models")
        
        # Lọc các file có đuôi tương ứng với định dạng model
        model_files = [file for file in files if file.endswith(model_extension)]
        
        # Đếm số lượng model
        model_count = len(model_files)
        
        return model_count
    except FileNotFoundError:
        print(f"Thư mục models không tồn tại.")
        return 0