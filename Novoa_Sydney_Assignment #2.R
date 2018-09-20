#List variables in dataset
names(Education_table)
#structure of data
str(Education_table)
#Create subset
Ed2<-Education_table[c(1:14),c(1,10,13,14,15,17)]                        
#Mean
summary(Ed2)
#Creating mode function
mode<-function(x) {
  unique_val<-unique(x)
  counts<-vector()
  for(i in 1: length(unique_val)){
    counts[i]<- length(which(x==unique_val[i]))
  }
  position<-c(which(counts==max(counts)))
  if(length(unique_val)==length(x))
    mode_x<-'Mode does not exist'
  else
    mode_x<-unique_val[position]
  return(mode_x)
}
#Attach mode to dataset
attach(Ed2)
#Check work
summary(`Doctoral degree`)
#Run mode#if output says "Mode does not exist" then data has no mode
mode(`Doctoral degree`)
mode(`High school graduate`)
mode(`Bachelor's degree`)
mode(`Associate's degree, academic`)
mode(`Master's degree`)
mode(Ed2$`High school graduate`)
#Standard Deviation
sd(Ed2$`Doctoral degree`)
#Variation
library(psych)
describe(Ed2) 
describe(Ed2$`Doctoral degree`)
#Variance
var(Ed2$`Doctoral degree`)
#Attempt to correct margin size
graphics.off()
par("mar")
par(mar=c(1,1,1,1))
#Histogram
hist(Education_table$`Doctoral degree`)
#Stem leaf plot
stem(Ed2$`Doctoral degree`, scale=1, width=80,atom=1e-08)
#Boxplot 
boxplot(Education_table$`Doctoral degree`, main="Education", xlab="X Axis Title", ylab="Y Axis Title")
