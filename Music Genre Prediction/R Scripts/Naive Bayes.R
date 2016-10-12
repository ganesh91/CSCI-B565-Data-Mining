#Import libraries
library(e1071)
library(corrplot)

#Read the Train data as data frame
tuneds <- read.csv("genresTrain.csv")

#train a Naive Bayes Model
s<-naiveBayes(GENRE~.,data=tuneds)

#Plot the confusion matrix
table(predict(s,tuneds),tuneds[,192])

#Compare the precited output with the baselines.
trainds <- read.csv("genresTest.csv")
baseline<-read.csv("genresBaseline.txt")
table(predict(s,trainds[-1,]),baseline[,1])
