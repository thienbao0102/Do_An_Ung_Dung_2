
import json
import pandas as pd
import numpy as np
import matplotlib.pyplot as plot

def train_model(version, data):

    # Checking for missing values
    data.isnull().sum()
    # Encode categorical variables (e.g., Gender, School Type)
    data = pd.get_dummies(data, drop_first=True)

    print(data)

    # Define the target variable (e.g., "Performance") and features (e.g., study hours, etc.)
    X = data.drop('G3', axis=1)  # Features
    y = data['G3']  # Target (performance category or score)

    X.head()

    from sklearn.model_selection import train_test_split

    # Split into training and testing datasets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    from sklearn.tree import DecisionTreeClassifier

    # Initialize the model
    model = DecisionTreeClassifier(random_state=42)

    # Train the model
    model.fit(X_train, y_train)

    # Make predictions
    y_pred = model.predict(X_test)

    from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

    # Check accuracy
    accuracy = accuracy_score(y_test, y_pred)

    # Confusion matrix
    conf_matrix = confusion_matrix(y_test, y_pred)

    # Classification report
    class_report = classification_report(y_test, y_pred)

    print(f"Accuracy: {accuracy}")
    print(f"Confusion Matrix:\n {conf_matrix}")
    print(f"Classification Report:\n {class_report}")

    from sklearn.tree import DecisionTreeRegressor

    # Initialize the model
    model = DecisionTreeRegressor(random_state=42)

    # Train the model
    model.fit(X_train, y_train)

    # Make predictions
    y_pred = model.predict(X_test)

    from sklearn.metrics import mean_squared_error, r2_score

    # Mean Squared Error
    mse = mean_squared_error(y_test, y_pred)

    # R-squared
    r2 = r2_score(y_test, y_pred)

    print(f"Mean Squared Error: {mse}")
    print(f"R-squared: {r2}")

    import pickle

    # save the model to disk
    filename = "models/finalized_model_v{}.pkl".format(version)
    pickle.dump(model, open(filename, 'wb'))

    # Lưu cấu trúc cột
    # Lưu cấu trúc cột
    train_columns = X_train.columns.tolist()
    filenameTrainColumns = "Column_Trains/train_columns{}.json".format(version)
    with open(filenameTrainColumns, "w") as f:
        json.dump(train_columns, f)

