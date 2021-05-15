ds <- read.csv("C:/Users/riddh/OneDrive/Documents/Edwisor/Cab Fare Prediction/train_cab.csv", sep = ",", header = T, na.strings = c(" ", "", "NA","0"))

ds_missingVal = data.frame(apply(ds,2,function(x){sum(is.na(x))}))
ds_missingVal$Columns = row.names(ds_missingVal)
names(ds_missingVal)[1] =  "Missing_percentage"
ds_missingVal$Missing_percentage = (ds_missingVal$Missing_percentage/nrow(ds)) * 100
ds_missingVal = ds_missingVal[order(-ds_missingVal$Missing_percentage),]
row.names(ds_missingVal) = NULL
ds_missingVal = ds_missingVal[,c(2,1)]
write.csv(ds_missingVal, "Missing_perc.csv", row.names = F)

ds_new <- na.omit(ds)
ds_new = ds_new[,c(2,1,3,4,5,6,7)]

for (i in 2:7){
  if(class(ds_new[,i]) == "factor")
  {
    ds_new[,i] <- as.numeric(ds_new[,i])
  }
}

write.csv(ds_new, "new_trainCab.csv", row.names = F)
