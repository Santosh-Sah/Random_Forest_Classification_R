source("RandomForestClassificationUtils.R")

#reading RandomForestClassification model
randomForestClassificationModel = readRDS("RandomForestClassificationModel.RDS")

#reading testing set data
randomForestClassificationTestingSet <- readRDS("RandomForestClassificationTestingSet.RDS")

#reading predicted values of the testing set
randomForestClassificationPredictedValuesForTestingSet <- readRDS("RandomForestClassificationPredictedValuesForTestingSet.RDS")

randomForestClassificationConfusionMatrix = table(randomForestClassificationTestingSet[, 3], randomForestClassificationPredictedValuesForTestingSet)

randomForestClassificationConfusionMatrix

#   0  1
# 0 56  8
# 1  4 32
