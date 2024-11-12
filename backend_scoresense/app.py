from joblib import load
from flask_cors import CORS
import pandas as pd
from flask import Flask, request, jsonify
import json

app = Flask('scoresense')
CORS(app)


model = load('finalized_model.pkl')


@app.route('/predict', methods=['POST'])
def predict():
    # Nhận dữ liệu JSON và chuyển về dạng list
    data = request.get_json()
    data = pd.DataFrame(data[1:], columns=data[0])
    print(data)
    data = pd.get_dummies(data,drop_first=True)
    with open("train_columns.json", "r") as f:
        train_columns = json.load(f)
    data = data.reindex(columns=train_columns, fill_value=0)
    print(data.columns)
    # Thực hiện dự đoán
    predictions = model.predict(data)  
    # Trả kết quả
    return jsonify({"predictions": predictions.tolist()})  # Chuyển kết quả về JSON

if __name__ == "__main__":
    app.run(debug=True)