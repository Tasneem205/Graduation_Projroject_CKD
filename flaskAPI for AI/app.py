import joblib
import numpy as np
from PIL import Image
from flask import Flask, request, jsonify
import os
import pandas as pd
from keras.src.saving import load_model
from werkzeug.utils import secure_filename
import sklearn

flask_app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

flask_app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

directory = os.path.dirname(__file__)
imgmodel_path = os.path.join(directory, "imgmodel.h5")

script_dir = os.path.dirname(__file__)
model_path = os.path.join(script_dir, "model.h5")
scaler_path = os.path.join(os.path.dirname(__file__), 'scaler.pkl')

model = load_model(model_path)
X_scaler = joblib.load(scaler_path)

imgmodel = load_model(imgmodel_path)


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def preprocess_image(image_path):
    """Load and preprocess the image to the format your model expects."""
    img = Image.open(image_path)
    img = img.resize((224, 224))
    img_array = np.array(img)
    # img_array = img_array / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    return img_array


@flask_app.route("/predict_test", methods=["POST"])
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


@flask_app.route("/predict_scan", methods=["POST"])
def predict():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        filepath = os.path.join(flask_app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)
        scan_image = preprocess_image(filepath)
        prediction = model.predict(scan_image)
        return jsonify({"message": "Image uploaded successfully", "prediction": prediction}), 200
    else:
        return jsonify({"error": "Invalid file type"}), 400


if __name__ == "__main__":
    flask_app.run(debug=True)
