library(rpart)
library(rpart.plot)
library(rattle)
library(entropy)
#Load the data into R
setwd("C:/Users/Ganesh/Google Drive/Courses/CSCI B 565/Homework/Homework 2")
del<-read.csv(file = "breast-cancer-wisconsin.data",header = FALSE,na.strings = "?")
head(del)
colnames(del)<-c("SCN","Clump.Thickness","Cell.Size","Cell.Shape","M.Adhesion","SECS","B.Nuclei","B.Chromatin","N.Nucleoli","Mitoses","class")
delstar<-del[complete.cases(del),]
delm<-del[!complete.cases(del),]
write.csv(delstar,"bcData.csv",row.names = FALSE)

#Train a Decision Tree for finding B.Nuclei missing values
fit<-rpart(B.Nuclei~Clump.Thickness+Cell.Shape+Cell.Size+M.Adhesion+SECS+B.Nuclei+B.Chromatin+N.Nucleoli+Mitoses,data=delstar,method = "class")
prp(fit)
nas<-predict(fit,newdata=delm,type = "class")
delmstar<-delm
delmstar$B.Nuclei<-as.numeric(as.character(nas))

#Train a decision tree to predict the class from other values
fit1<-rpart(class~Clump.Thickness+Cell.Shape+Cell.Size+M.Adhesion+SECS+B.Nuclei+B.Chromatin+N.Nucleoli+Mitoses+B.Nuclei,data=delstar,method = "class")
prp(fit1)

#Function for Variance
data.variance <- function(dataframe,attributelist){
  names<-colnames(dataframe)
  toPrintnames=c()
  toPrintVal=c()
  for(i in attributelist){
    variance<-var(dataframe[,i])
    toPrintnames=c(toPrintnames,names[i])
    toPrintVal=c(toPrintVal,variance)
  }
  printdf<-as.data.frame(cbind(toPrintnames,toPrintVal))
  colnames(printdf)<-c("label","variance")
  print(printdf)
}
data.variance(delstar,c(2:10))

#Function for Entropy
data.entropy <- function(dataframe,attributelist){
  names<-colnames(dataframe)
  toPrintnames=c()
  toPrintVal=c()
  for(i in attributelist){
    entropy_d<-entropy(dataframe[,i],unit="log2")
    toPrintnames=c(toPrintnames,names[i])
    toPrintVal=c(toPrintVal,entropy_d)
  }
  printdf<-as.data.frame(cbind(toPrintnames,toPrintVal))
  colnames(printdf)<-c("label","Entropy")
  print(printdf)
}
data.entropy(delstar,c(2:10))

#Calculate KL Distance
calculateKL <- function(dataframe,col1,col2){
  output<-matrix(0,nrow=length(col1),ncol = length(col1))
  for (i in 1:length(col1)){
    for(j in 1:length(col1)){
      #print(i)
      k1<-freqs(dataframe[,i])
      k2<-freqs(dataframe[,j])
      kl<-KL.empirical(k1,k2,unit = "log2")
      output[i,j]<-kl
      
    }
  }
  print(output)
}
delkl<-delstar[,2:10]
col<-1:9
calculateKL(delkl,col,col)