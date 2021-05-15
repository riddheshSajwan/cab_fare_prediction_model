ds_Test <- read.csv("C:/Users/riddh/OneDrive/Documents/Edwisor/Cab Fare Prediction/test.csv", sep = ",", header = T)
ds_Final <- ds_Test
ds_Final$fare_amount <- predict(mlrmodel, ds_Final[,2:6])
