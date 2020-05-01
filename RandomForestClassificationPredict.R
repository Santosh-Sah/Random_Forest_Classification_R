source("RandomForestClassificationUtils.R")
library(randomForest)

#reading RandomForestClassification model
randomForestClassificationModel = readRDS("RandomForestClassificationModel.RDS")

inputValue <- data.frame(Age = c(28,30), EstimatedSalary = c(43000,30000))
inputValue[, 1:2] = scale(inputValue[, 1:2])


#predicting testing set result.
y_pred = predict(randomForestClassificationModel, newdata = inputValue)

y_pred
