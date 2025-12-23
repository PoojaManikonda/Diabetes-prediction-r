# Diabetes Prediction using R

## 📌 Project Overview
This project predicts the likelihood of a person having diabetes risk using clinical and demographic data.
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
The logistic regression model was able to predict the chances of a person having Diabetes when clinical parameters such as pregnancy, glucose, blood pressure, BMI, age, and diabetes pedigree function are provided. However, further model optimization and data balancing techniques improve the model's performance towards identifying diabetes risk patients.

## Confusion Matrix before optimization
            Reference
Prediction   0    1
         0  127  37
         1  23   43
                                          
               Accuracy: 0.7391          
                 95% CI: (0.6773, 0.7946)
    No Information Rate: 0.6522          
    P-Value [Acc > NIR]: 0.002949        
                                          
                  Kappa: 0.4005          
                                          
 McNemar's Test P-Value: 0.093290        
                                          
            Sensitivity: 0.8467          
            Specificity: 0.5375          
         Pos Pred Value: 0.7744          
         Neg Pred Value: 0.6515          
             Prevalence: 0.6522          
         Detection Rate: 0.5522          
   Detection Prevalence: 0.7130          
      Balanced Accuracy: 0.6921          
                                          
       'Positive' Class : 0         

## 📈 Model Optimization and Performance

Before optimization, the logistic regression model demonstrated high sensitivity but low specificity, indicating bias toward the majority class and reducedbalanced accuracy (69.2%).

Class imbalance is addressed using SMOTE within cross-validation, and the model is optimized using ROC-AUC. Logistic regression is also regularized to reduce overfitting and improve generalization. As a result, balanced accuracy is improved from 73.9% to 75.6%, with notable gains in specificity(53.8% to 76.7%) and AUC value of 0.84. Therefore, the optimized model reduced false negative predictions and achieved more reliable performance for diabetes risk screening.

## Confusion Matrix and Statistics

          Reference
Prediction  No Yes
       No  115  21
       Yes  35  59
                                          
               Accuracy : 0.7565          
                 95% CI : (0.6958, 0.8105)
    No Information Rate : 0.6522          
    P-Value [Acc > NIR] : 0.000421        
                                          
                  Kappa : 0.4844          
                                          
 McNemar's Test P-Value : 0.082352        
                                          
            Sensitivity : 0.7375          
            Specificity : 0.7667          
         Pos Pred Value : 0.6277          
         Neg Pred Value : 0.8456          
             Prevalence : 0.3478          
         Detection Rate : 0.2565          
   Detection Prevalence : 0.4087          
      Balanced Accuracy : 0.7521          
                                          
       'Positive' Class : Yes  
Area under the curve: 0.8422

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

All code was executed, interpreted, and further evaluated independently for improvements, learning, and
portfolio demonstration purposes.

Reference:
https://www.geeksforgeeks.org/r-language/diabetes-prediction-using-r/

## 👩‍⚕️ Author
Pooja Manikonda  
MS Health Informatics

