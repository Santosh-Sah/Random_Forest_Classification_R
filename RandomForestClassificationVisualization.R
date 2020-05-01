source("RandomForestClassificationUtils.R")
library(randomForest)
library(ggplot2)
library(ElemStatLearn)

#reading training set 
randomForestClassificationTrainingSet <- readRDS("RandomForestClassificationTrainingSet.RDS")

#reading testing set data
randomForestClassificationTestingSet <- readRDS("RandomForestClassificationTestingSet.RDS")

#reading RandomForestClassification model
randomForestClassificationModel = readRDS("RandomForestClassificationModel.RDS")

#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(randomForestClassificationTrainingSet, randomForestClassificationModel){
  
  set = randomForestClassificationTrainingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.5)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.5)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_set = predict(randomForestClassificationModel, newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  plot(set[, -3],
       main = 'Random Forest Classification (Training set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("RandomForestClassificationTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(randomForestClassificationTestingSet, randomForestClassificationModel){
  
  set = randomForestClassificationTestingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_set = predict(randomForestClassificationModel, newdata = grid_set)
  y_grid = ifelse(prob_set > 0.5, 1, 0)
  plot(set[, -3],
       main = 'Random Forest Classification (Test set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("RandomForestClassificationTestingsetResult.png")
  
}

#visualisingTrainingSetResult(randomForestClassificationTrainingSet, randomForestClassificationModel)
#visualisingTestingSetResult(randomForestClassificationTestingSet, randomForestClassificationModel)

# Plotting the tree
png('RandomForestClassification.png')
plot(randomForestClassificationModel)
text(randomForestClassificationModel)
dev.off()
