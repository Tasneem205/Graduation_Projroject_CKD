import joblib
import numpy as np
from flask import Flask, request, jsonify
from keras.models import load_model
import os
import pandas as pd


# Create flask app
flask_app = Flask(__name__)

script_dir = os.path.dirname(__file__)
model_path = os.path.join(script_dir, "model.h5")
scaler_path = os.path.join(os.path.dirname(__file__), 'scaler.pkl')

# model = load_model(open(model_path, "rb"))
model = load_model(model_path)
X_scaler = joblib.load(scaler_path)


@flask_app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json(force=True)
    df = pd.json_normalize(data)
    # Replace invalid values with NaN
    df['packed_cell_volume'] = df['packed_cell_volume'].replace('\t?', np.nan)
    df['red_blood_cell_count'] = df['red_blood_cell_count'].replace('\t?', np.nan)
    df['white_blood_cell_count'] = df['white_blood_cell_count'].replace('\t?', np.nan)
    df['red_blood_cells'] = df['red_blood_cells'].replace('\t?', np.nan)

    float_features = [float(x) for x in data.values()]
    features = [np.array(float_features)]
    features_scaled = X_scaler.transform(features)
    prediction = model.predict(features_scaled)
    # return prediction
    return jsonify(prediction=str(prediction[0][0]))


if __name__ == "__main__":
    flask_app.run(debug=True)
