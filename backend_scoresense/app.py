from joblib import load
from flask_cors import CORS
import pandas as pd
from flask import Flask, request, jsonify
import json

from handelRequest.handelApi import PredictScore

app = Flask('scoresense')
CORS(app)
model = load('finalized_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    # Nhận dữ liệu JSON và chuyển về dạng list
    data = request.get_json()
    data = pd.DataFrame(data[1:], columns=data[0])
    return PredictScore(data)

@app.route('/fitmodel', methods=['POST'])
def fitModel():
    data = request.get_json()
    data = pd.DataFrame(data[1:], columns=data[0])

if __name__ == "__main__":
    app.run(debug=True)