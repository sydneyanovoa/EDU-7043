#Import dataset
library(readr)
Death_Self_Harm <- read_csv("Desktop/Deaths-and-Death-Rates-by-Cause-and-Gender-3.csv", 
                            col_types = cols(`2012` = col_number(), 
                                             `2013` = col_number(), `2014` = col_number(), 
                                             `2015` = col_number(), `2016` = col_number()))
#Import second dataset 
library(readr)
UrbanizationTX <- read_csv("Desktop/UrbanizationTX.csv")
View(UrbanizationTX)

#Merge datasets
NSSI<-merge(Death_Self_Harm, UrbanizationTX, by= "County_Name", "Area")
View(NSSI)

#Dummy code Gender
NSSI$Gender[NSSI$Gender=="Male"]<-"1"
NSSI$Gender[NSSI$Gender=="Female"]<-"2"
NSSI$Gender<-factor(NSSI$Gender)

#Urbanization of Counties
NSSI$Metro<-ifelse(NSSI$RUCC_2013==1 | NSSI$RUCC_2013==2| NSSI$RUCC_2013==3, 1, 0)
NSSI$NonmetroAdj<-ifelse(NSSI$RUCC_2013==4 | NSSI$RUCC_2013==6, 1, 0)
NSSI$NonmetroNA<-ifelse(NSSI$RUCC_2013==5 | NSSI$RUCC_2013==7, 1, 0)

#Regions of Texas
NSSI$North<-ifelse(NSSI$Region==1| NSSI$Region==2| NSSI$Region==3| NSSI$Region==4,1,0)
NSSI$West<-ifelse(NSSI$Region==9| NSSI$Region==10, 1, 0)
NSSI$Central<-ifelse(NSSI$Region==7, 1, 0)
NSSI$South<-ifelse(NSSI$Region==8| NSSI$Region==11, 1, 0)
NSSI$East<-ifelse(NSSI$Region==4| NSSI$Region==5| NSSI$Region==6, 1, 0)

#Check work
table(NSSI$Metro)
table(NSSI$NonmetroAdj)
table(NSSI$NonmetroNA)

table(NSSI$North)
table(NSSI$West)
table(NSSI$Central)
table(NSSI$South)
table(NSSI$East)

#Combine urbanization categories into one variable 
NSSI$Urbanization<-ifelse(NSSI$Metro==1,1, ifelse(NSSI$NonmetroAdj==1,2, ifelse(NSSI$NonmetroNA==1,3,0)))
table(NSSI$Urbanization)

#Combine TX regions into one variable 
NSSI$TXRegions<-ifelse(NSSI$North==1, 1, ifelse(NSSI$West==1, 2, ifelse(NSSI$Central==1, 3, ifelse(NSSI$South==1, 4, ifelse(NSSI$East==1, 5, 0)))))
table(NSSI$TXRegions)

#Remove NA's in year 2013
NSSI2<-subset(NSSI, !is.na(NSSI$`2013`))
View(NSSI2)
attach(NSSI2)

#Descriptive stats on death rates 
library(psych)
describe(NSSI2$`2013`)
var(NSSI2$`2013`)
str(NSSI2)

#Descriptive stats on variables gender, urbanization, txregions
library(psych)
#Gender
table(NSSI2$Gender)
describe(NSSI2$`2013`[Gender==1])
describe(NSSI2$`2013`[Gender==2])
#Urbanization
describe(NSSI2$`2013`[Urbanization==1])
table(NSSI2$Urbanization==1)
describe(NSSI2$`2013`[Urbanization==2])
table(NSSI2$Urbanization==2)
#TX region
table(NSSI2$TXRegions)
describe(NSSI2$`2013`[TXRegions==1])
describe(NSSI2$`2013`[TXRegions==2])
describe(NSSI2$`2013`[TXRegions==3])
describe(NSSI2$`2013`[TXRegions==4])
describe(NSSI2$`2013`[TXRegions==5])

#Correlations
cor.test(NSSI2$`2013`, NSSI2$TXRegions, method="spearman")
cor.test(NSSI2$`2013`, NSSI2$TXRegions)

cor.test(NSSI2$`2013`, NSSI2$Urbanization, method = "spearman")
cor.test(NSSI2$`2013`, NSSI2$Urbanization)
