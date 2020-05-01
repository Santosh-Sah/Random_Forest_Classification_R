source("RandomForestClassificationUtils.R")

randomForestClassificationDatasetList <- importRandomForestClassificationDataset("Random_Forest_Classification_Social_Network_Ads.csv")

saveTrainingAndTestingDataset(randomForestClassificationDatasetList[[1]], randomForestClassificationDatasetList[[2]])
