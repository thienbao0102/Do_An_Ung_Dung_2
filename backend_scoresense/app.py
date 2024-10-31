import pickle
from joblib import load
from flask_cors import CORS
import pandas as pd
from sklearn.model_selection import train_test_split
from flask import Flask, request, jsonify

app = Flask('scoresense')
CORS(app)
import os

file_path = 'decision_tree_model.pkl'
print(os.path.exists(file_path))

model = load('finalized_model.pkl')


@app.route('/predict', methods=['POST'])
def predict():
    # Nhận dữ liệu JSON và chuyển về dạng list
    data = request.get_json()  # Data ở đây là List[List]
    data = pd.DataFrame(data[1:], columns=data[0])
    data = pd.get_dummies(data,drop_first=True)
    print(data.columns)
    # Thực hiện dự đoán
    predictions = model.predict(data)  # Giả sử model chấp nhận input là List[List]
    
    # Trả kết quả
    return jsonify({"predictions": predictions.tolist()})  # Chuyển kết quả về JSON

if __name__ == "__main__":
    app.run(debug=True)