library(tidyverse)
library(randomForest)
library(caret)


dsPredictors <- dsOutRemoved[,2:7]

mlrmodel <- lm(fare_amount ~., data = dsPredictors)
summary(mlrmodel)

rfmodel <- randomForest(fare_amount ~ ., data = dsPredictors)
print(rfmodel)

trainIndex = createDataPartition(dsPredictors$fare_amount, p = .80, list = FALSE)

dsTest <- dsPredictors[-trainIndex,1:6]

predictionsRF_DT = predict(rfmodel, dsTest[,2:6])

predictionsMLR_DT = predict(mlrmodel, dsTest[,2:6])

AccuracyMLR<- 100 - RMSE(predictionsMLR_DT, dsTest$fare_amount)*100/mean(dsTest$fare_amount)
print(paste("Accuracy of Multiple Linear Regression is",AccuracyMLR))

AccuracyRF <- 100 - RMSE(predictions_DT, dsTest$fare_amount)*100/mean(dsTest$fare_amount)
print(paste("Accuracy of Random Forest is",AccuracyRF))

