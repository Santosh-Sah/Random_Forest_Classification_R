source("RandomForestClassificationUtils.R")
library(randomForest)

#reading testing set data
randomForestClassificationTestingSet <- readRDS("RandomForestClassificationTestingSet.RDS")

#feature scaling
randomForestClassificationTestingSet[-3] = scale(randomForestClassificationTestingSet[-3])

#reading RandomForestClassification model
randomForestClassificationModel = readRDS("RandomForestClassificationModel.RDS")

#predicting testing set result.
y_pred = predict(randomForestClassificationModel ,newdata = randomForestClassificationTestingSet[-3])

#Saving prediced values for testing set
saveRandomForestClassificationPredictedValuesForTestingSet(y_pred)

