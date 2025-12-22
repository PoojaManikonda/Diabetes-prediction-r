# Installing  packages
install.packages("caTools")
install.packages("caret")
install.packages("e1071")
install.packages("readr")

# Load packages
library(readr)
library(caTools)
library(caret)
library(e1071)

data <- read.csv(file.choose())
head(data) #first 6 rows of the dataset

#Data Preprocessing

str(data) #column data types
summary(data) #descriptive statistics for each column

table(data$Outcome)
prop.table(table(data$Outcome))

#missing values
colSums(is.na(data))

# separating features
X <- data[, 1:8]
y <- data[, 9]

#Scaling the feature variables only to standardize their values (mean = 0, D = 1)
scaled_X <- as.data.frame(scale(X))

#Recombining the scaled features with the target to form the final dataset

scaled_data <- cbind(scaled_X, y)

X <- scaled_data[, 1:8]
y <- scaled_data[, 9]

set.seed(123)
sample <- sample.split(y, SplitRatio = 0.7)
X_train <- X[sample == TRUE, ]
y_train <- y[sample == TRUE]
X_test <- X[sample == FALSE, ]
y_test <- y[sample == FALSE]


#EDA

sapply(data, class)

#Correlation Heat Map
library(ggplot2)
library(reshape2)

data_num <- data[sapply(data, is.numeric)]
correlation_matrix <- cor(data_num, use = "complete.obs")

correlation_melted <- melt(correlation_matrix)

ggplot(correlation_melted, aes(Var1, Var2, fill=value)) +
  geom_tile(color="white") +
  scale_fill_gradient2(low="blue", high="red", mid="white", midpoint=0, 
                       limit=c(-1,1), space="Lab", name="Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Correlation Heatmap", x="Features", y="Features")



#Distribution of Diabetes Outcomes

outcome_counts <- table(data$Outcome)
outcome_df <- data.frame(Outcome = names(outcome_counts), 
                         Count = as.numeric(outcome_counts))

ggplot(outcome_df, aes(x=Outcome, y=Count)) +
  geom_bar(stat="identity", fill="pink") +
  labs(title="Distribution of Diabetes Outcomes", x="Outcome", y="Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12),
        axis.title = element_text(size=12),
        plot.title = element_text(size=16, face="bold"))

#Histogram with Outcome split

library(ggplot2)

diabetes_subset <- data[, c("Pregnancies", "Glucose", "BloodPressure", 
                            "BMI", "Age", "Outcome")]

ggplot(diabetes_subset, aes(x = Pregnancies, fill = factor(Outcome))) +
  geom_histogram(position = "identity", bins = 30, alpha = 0.7) +
  labs(title = "Distribution of Pregnancies by Outcome") +
  facet_wrap(~Outcome, scales = "free_y") +
  theme_minimal()

#Boxplot for BMI by Outcome

library(ggplot2)

ggplot(data, aes(x = factor(Outcome), y = BMI, fill = factor(Outcome))) +
  geom_boxplot() +
  labs(title = "BMI Distribution by Outcome") +
  theme_minimal()

#Building the Model

log_model <- glm(y_train ~ ., data = X_train, family = binomial)

summary(log_model)

#Evaluating the model

predictions <- predict(log_model, newdata = X_test, type = "response")

predictions <- factor(ifelse(predictions > 0.5, 1, 0), 
                      levels = levels(as.factor(y_test)))

confusionMatrix(predictions, as.factor(y_test))

#Making Predictions using the Model
predict_diabetes <- function(pregnancies, glucose, bloodpressure, skinthickness, 
                             insulin, bmi, diabetespedigreefunction, age) {
  input_data <- data.frame(
    Pregnancies = pregnancies,
    Glucose = glucose,
    BloodPressure = bloodpressure,
    SkinThickness = skinthickness,
    Insulin = insulin,
    BMI = bmi,
    DiabetesPedigreeFunction = diabetespedigreefunction,
    Age = age
  )
  input <- as.data.frame(input_data)
  prediction <- predict(log_model, newdata = input, type = "response")
  prediction <- factor(ifelse(prediction > 0.5, 1, 0), 
                       levels = levels(as.factor(prediction)))
  
  return(prediction)
}

new_patient <- data.frame(
  pregnancies = 6,
  glucose = 148,
  bloodpressure = 72,
  skinthickness = 35,
  insulin = 0,
  bmi = 33.6,
  diabetespedigreefunction = 0.627,
  age = 50
)

prediction <- predict_diabetes(
  new_patient$pregnancies,
  new_patient$glucose,
  new_patient$bloodpressure,
  new_patient$skinthickness,
  new_patient$insulin,
  new_patient$bmi,
  new_patient$diabetespedigreefunction,
  new_patient$age
)

if (any(prediction == 1)) {
  cat("Based on the model's prediction, there is a higher chance of diabetes.")
} else {
  cat("Based on the model's prediction, the risk of diabetes appears lower.")
}

