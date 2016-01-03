library(corrplot)
tuneds <- read.csv("genresTrain.csv")

library(e1071)
s<-naiveBayes(GENRE~.,data=tuneds)
table(predict(s,tuneds),tuneds[,192])

trainds <- read.csv("genresTest.csv")
baseline<-read.csv("genresBaseline.txt")
table(predict(s,trainds[-1,]),baseline[,1])
