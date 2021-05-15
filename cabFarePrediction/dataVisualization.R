library(psych)
library(ggplot2)

#Probability Density Funciton with histogram and normal fit
multi.hist(dsOutRemoved[,2:7], main = NULL, dcol = c("blue", "red"),
           dlty = c("solid", "solid"), bcol = "linen")


#histogram with mean line
for (i in 2:7){
  
  title_val <- paste("Histogram and Mean of ",colnames(dsOutRemoved[i])) 
  hist_plot<-ggplot(dsOutRemoved, aes(x=dsOutRemoved[,i])) + 
    geom_histogram(binwidth=0.5,color="darkblue", fill="lightblue",
                   linetype="solid")+
    labs(title=title_val,x=colnames(dsOutRemoved[i]), y = "Frequency")+
    theme_classic() +
    geom_vline(aes(xintercept=mean(dsOutRemoved[,i])),
               color="red", linetype="dashed", size=1)
  
  print(hist_plot)
}
