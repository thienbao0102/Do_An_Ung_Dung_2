from joblib import load
from flask_cors import CORS
import pandas as pd
from flask import Flask, request, jsonify
import json

from handelRequest.handelApi import PredictScore,TrainModel,count_models

app = Flask('scoresense')
CORS(app)


@app.route('/predict', methods=['POST'])
def predict():
    # Nhận dữ liệu JSON và chuyển về dạng list
    data = request.get_json()
    input_data = data.get("inputDataImport", [])
    version = data.get("version", 1)
    print(version)
    input_data = pd.DataFrame(input_data[1:], columns=input_data[0])
    return PredictScore(input_data,version)

@app.route('/trainmodel', methods=['POST'])
def trainModel():
    data = request.get_json() 
    data = pd.DataFrame(data[1:], columns=data[0])
    TrainModel(data)
    numModel = count_models()
    return jsonify(numModel = numModel)

@app.route('/totalmodel', methods=['Get'])
def totalModel():
    numModel = count_models()
    return jsonify(numModel = numModel)

if __name__ == "__main__":
    app.run(debug=True)