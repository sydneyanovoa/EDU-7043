#Pull in dataset/changed column type from character to numeric
library(readxl)
Deaths_and_Death_Rates_by_Cause <- read_excel("Desktop/Deaths-and-Death-Rates-by-Cause.xltx", 
                                              col_types = c("text", "text", "text", 
                                                            "text", "text", "numeric", "numeric", 
                                                            "numeric", "numeric", "numeric"))
View(Deaths_and_Death_Rates_by_Cause)
#List variables in dataset
names(Deaths_and_Death_Rates_by_Cause)
#Structure of dataset 
str(Deaths_and_Death_Rates_by_Cause)
#Mean and Median of variables
summary(Deaths_and_Death_Rates_by_Cause)
#Create mode function 
mode<-function(x)
{
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
#Attach dataset
attach(Deaths_and_Death_Rates_by_Cause)
#Mode of dataset
mode('2012')
mode('2013')
mode('2014')
mode('2015')
mode('2016')
#install packages ('psych')
install.packages('psych')
library(psych)
#Finde Range & Standard Deviation
describe(Deaths_and_Death_Rates_by_Cause$'2016')
#Variation 
var(Deaths_and_Death_Rates_by_Cause$`2016`, na.rm = TRUE)
#Histogram
hist(Deaths_and_Death_Rates_by_Cause$`2016`)
#Boxplot
boxplot(Deaths_and_Death_Rates_by_Cause$'2016')
