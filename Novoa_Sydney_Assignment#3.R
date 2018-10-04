#Pull in dataset/changed column type from character to numeric
library(readr)
Deaths_and_Death_Rates_by_Cause2 <- read_csv("Desktop/Deaths-and-Death-Rates-by-Cause2.csv", 
                                             col_types = cols(`2012` = col_number(), 
                                                              `2013` = col_number(), `2014` = col_number(), 
                                                              `2015` = col_number(), `2016` = col_number()))
View(Deaths_and_Death_Rates_by_Cause2)
#Look at my data
names(Deaths_and_Death_Rates_by_Cause2)
str(Deaths_and_Death_Rates_by_Cause2)
#Creating subset 
Death<-Deaths_and_Death_Rates_by_Cause2[c(1:84), c(8,9,10)]
#Checking work
str(Death)
#Finding central tendancies (mean, median)
summary(Death)
#Create mode function
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
#Find mode
mode(Death$`2014`)
mode(Death$`2015`)
mode(Death$`2016`)
#Instal psych package
install.packages("psych")
library(psych)
#Sd, range, median, mean
describe(Death$`2014`)
describe(Death$`2015`)
describe(Death$`2016`)
#Variance
var(Death$`2014`, na.rm = TRUE)
var(Death$`2015`, na.rm = TRUE)
var(Death$`2016`, na.rm = TRUE)
#Identifying normality 
hist(Death$`2014`)
hist(Death$`2015`)
hist(Death$`2016`)
#QQ plot
qqnorm(Death$`2014`);qqline(Death$`2014`)
qqnorm(Death$`2015`);qqline(Death$`2015`)
qqnorm(Death$`2016`);qqline(Death$`2016`)
