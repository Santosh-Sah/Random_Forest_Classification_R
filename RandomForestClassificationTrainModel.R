source("RandomForestClassificationUtils.R")
library(randomForest)

#reading training set 
randomForestClassificationTrainingSet <- readRDS("RandomForestClassificationTrainingSet.RDS")

#feature scaling
randomForestClassificationTrainingSet[-3] = scale(randomForestClassificationTrainingSet[-3])

set.seed(1234)

# Fitting RandomForestClassification to the Training set
randomForestClassification = randomForest(x = randomForestClassificationTrainingSet[-3], y = randomForestClassificationTrainingSet$Purchased, ntree = 500)

#saving RandomForestClassification model
saveRandomForestClassificationModel(randomForestClassification)
