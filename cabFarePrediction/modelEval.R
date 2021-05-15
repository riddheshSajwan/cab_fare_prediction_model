ds_Test <- read.csv("C:/Users/riddh/OneDrive/Documents/Edwisor/Cab Fare Prediction/test.csv", sep = ",", header = T)
ds_Test <- ds_Test[,2:6]
#predictions and accuracy for MLR
PredictionsMLR <- mlrmodel %>% predict(ds_Test)
AccuracyMLR <- 100 - RMSE(PredictionsMLR, ds_Test$fare_amount)*100/mean(ds_Test$fare_amount)
print(paste("Accuracy for fare_amount ",AccuracyMLR))

#predictions and accuracy for RF
PredictionsRF <- rfmodel %>% predict(ds_Test)
AccuracyRF <- 100 - RMSE(PredictionsRF, ds_Test$fare_amount)*100/mean(ds_Test$fare_amount)
print(paste("Accuracy for fare_amount ",AccuracyRF))

