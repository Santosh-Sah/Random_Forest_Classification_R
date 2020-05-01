importRandomForestClassificationDataset <- function(randomForestClassificationDatasetFileName) {
  
  #importing dataset
  randomForestClassificationDataset = read.csv(randomForestClassificationDatasetFileName)
  
  #getting the required columns
  randomForestClassificationDataset = randomForestClassificationDataset[3:5]
  
  #encoding target feature as factor
  randomForestClassificationDataset$Purchased = factor(randomForestClassificationDataset$Purchased, levels = c(0, 1))
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  randomForestClassificationDatasetSlpit = sample.split(randomForestClassificationDataset$Purchased, SplitRatio = 0.75)
  
  randomForestClassificationTrainingSet = subset(randomForestClassificationDataset, randomForestClassificationDatasetSlpit == TRUE)
  
  randomForestClassificationTestingSet = subset(randomForestClassificationDataset, randomForestClassificationDatasetSlpit == FALSE)
  
  
  returnList <- list(randomForestClassificationTrainingSet, randomForestClassificationTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(randomForestClassificationTrainingSet, randomForestClassificationTestingSet){
  
  saveRDS(randomForestClassificationTrainingSet, file = "RandomForestClassificationTrainingSet.RDS")
  saveRDS(randomForestClassificationTestingSet, file = "RandomForestClassificationTestingSet.RDS")
  
}

#Save RandomForestClassification Model
saveRandomForestClassificationModel <- function(randomForestClassificationModel) {
  
  saveRDS(randomForestClassificationModel, file = "RandomForestClassificationModel.RDS")
}

#Save prediced values for testing set
saveRandomForestClassificationPredictedValuesForTestingSet <- function(randomForestClassificationPredictedValuesForTestingSet) {
  
  saveRDS(randomForestClassificationPredictedValuesForTestingSet, file = "RandomForestClassificationPredictedValuesForTestingSet.RDS")
}
