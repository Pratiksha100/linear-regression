# -*- coding: utf-8 -*-
"""
Created on Fri Nov 15 16:47:50 2019

@author: pratiksha.garode

Data Model Name: House Price Predictor
"""

# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('kc_house_data.csv')
X = dataset.iloc[:, 5].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
X_train = X_train.reshape(-1, 1)
X_test = X_test.reshape(-1, 1)


# Fitting Simple Linear Regression to Training Set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Predicting The Test Set Results
y_pred = regressor.predict(X_test)

# Visualizing The Training Set Results
plt.scatter(X_train, y_train, color = 'orange')
plt.plot(X_train, regressor.predict(X_train), color = 'black')
plt.title('Area for Living Vs Price of The House(Training Set)')
plt.xlabel('Area for Living')
plt.ylabel('Price of The House')
plt.show()

# Visualizing The Test Set Results
plt.scatter(X_test, y_test, color = 'orange')
plt.plot(X_train, regressor.predict(X_train), color = 'black')
plt.title('Area for Living Vs Price of The House(Test Set)')
plt.xlabel('Area for Living')
plt.ylabel('Price of The House')
plt.show()