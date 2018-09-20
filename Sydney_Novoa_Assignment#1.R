#Create the vector x,y,z
x<-c(5,10,15,20,25,30)
y<-c(-1,NA, 75,3,5,8)
z<-c(5)
#Multiply first two vectors by z
x*z
y*z
#Store new objects
Object1<-(x*z)
Object2<-(y*z)
#Print vectors
print(Object1)
print(Object2)
#Replacing missing value
y<-ifelse(is.na(y), 2.5, y)
#Load dataset
#where is the load of the dataset? -20

#File import dataset-from text (readr) copy and paste link, click update, then import 
#Print state abbreviations
#This is smart go-around, but not the point of the exercise -5
head (state.abb,n=10)
#Mean of murder
mean (Assignment_1$Murder)
#Median of murder
median (Assignment_1$Murder)
#Mean of NE murder 
NewEngland<-subset(Assignment_1, State== "CT"|State== "NH"|State== "ME"|State=="MA"|State== "RI"|State=="VT")
mean(NewEngland$Murder)
#Bonus
#I'm not sure if this would have worked given the fact I do not know how you import the data.
mean(Assignment_1$Vcrime, na.rm= TRUE)

#75 out of 100. Next assignment I need you to give me all of your code. This includes the import of the dataset.

