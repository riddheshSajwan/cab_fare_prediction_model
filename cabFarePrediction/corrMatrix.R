library(mlbench)
library(caret)
library(gridExtra)

#dataframe with continuos variables
dsCont <- dsOutRemoved[,2:7]
#correlation analysis
corrMat <- cor(dsCont)

#printing out png of correlation matrix
png("correlationMatrix.png", height = 200, width = 600)
grid.table(corrMat)
dev.off()
