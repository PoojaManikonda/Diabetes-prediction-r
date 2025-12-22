# Diabetes Prediction using R

## 📌 Project Overview
This project predicts the likelihood of a person having diabetes using clinical and demographic data.
The analysis was conducted in R using statistical and machine learning techniques.

## 📊 Dataset
- Source: Pima Indians Diabetes Dataset
- Features include:
  - Pregnancies
  - Glucose
  - Blood Pressure
  - BMI
  - Age
  - Diabetes Pedigree Function
- Target variable: Outcome (Diabetes: Yes / No)

## 🧪 Methodology
- Data cleaning and preprocessing
- Feature scaling (standardization)
- Exploratory Data Analysis (EDA)
  - Correlation heatmap
  - Outcome distribution
  - Histograms and boxplots
- Train/Test split (70/30)
- Testing the model with new data
- Class imbalance handling using SMOTE
- Optimized logistic regression using regularization (glmnet)
- Model evaluation using confusion matrix and ROC–AUC

## 📈 Model Performance
- Accuracy: 75.6%
- Sensitivity (Recall – Diabetes): 73.8%
- Specificity: 76.7%
- Balanced Accuracy: 75.2%
- ROC–AUC: 0.84

## 🛠️ Tools & Technologies
- R
- RStudio
- caret
- caTools
- ggplot2
- e1071
- glmnet
- pROC

## 📈 Results
The logistic regression model was able to predict the chances of a person having Diabetes when clinical parameters such as pregnancy, glucose, blood pressure, BMI, age, and diabetes pedigree function are provided. However, further model optimization and data balancing techniques could improve the sensitivity/recall towards identifying diabetic patients.

## 📈 Model Performance

The optimized logistic regression model achieved an Area Under the ROC Curve (AUC) of 0.84, indicating strong discriminative ability between diabetic and non-diabetic
individuals.

## 📁 Files in this Repository
- `Diabetes_prediction.R` – Complete R script
- `diabetes.csv` – Dataset used
- `Visualization/` – outputs

## 🚀 How to Run
1. Open `Diabetes_prediction.R` in RStudio
2. Install required packages
3. Run the script line by line

## 📘 Project Reference & Acknowledgement
This project is a simulation and independent implementation inspired by a tutorial
published on GeeksforGeeks titled *“Diabetes Prediction using R”*.

The project was executed step-by-step to strengthen the practical understanding of healthcare data preprocessing, exploratory
analysis, class balancing, and predictive modeling.

All code was executed, interpreted, and adapted independently for learning and
portfolio demonstration purposes.

Reference:
https://www.geeksforgeeks.org/r-language/diabetes-prediction-using-r/

## 👩‍⚕️ Author
Pooja Manikonda  
MS Health Informatics

