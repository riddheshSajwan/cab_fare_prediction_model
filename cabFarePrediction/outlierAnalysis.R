library(psych)
library(ggplot2)

drawBoxP <- function(df){
  for (i in 2:7){  
    title_val <- paste("Boxplot (without Outliers) of ",colnames(df[i])) # paste("Boxplot without Outliers of ",colnames(df[i]))
   
    box_plot <- ggplot(df, aes(x='', y= df[,i])) + 
      geom_boxplot(outlier.color = "red", outlier.shape = 19,
                   outlier.size = 1.5, outlier.stroke = 0.5) + 
      labs(title=title_val,x=colnames(df[i]), y = "Frequency") + 
      geom_jitter(shape=16, position=position_jitter(0.2)) #with jitter
    print(box_plot)
  }  
}
#boxplot with outliers
drawBoxP(ds_new)
#removing outliers from passenger_count
unwanted_outliers <- boxplot(ds_new$passenger_count, plot = FALSE)$out
dsOutRemoved <- ds_new[-which(ds_new$passenger_count %in% unwanted_outliers ),]
drawBoxP(dsOutRemoved)

#effect of outliers

#with outliers

boxplot(ds_new$passenger_count, main="Boxplot for passenger_count with outliers", 
        ylab="passenger_count")
hist(ds_new$passenger_count, main="Histogram for passenger_count with outliers", 
     xlab="passenger_count")
#without outliers
boxplot(dsOutRemoved$passenger_count, main="Boxplot for passenger_count without outliers", 
        ylab="passenger_count")
hist(dsOutRemoved$passenger_count, main="Histogram for passenger_count without outliers", 
     xlab="passenger_count")
