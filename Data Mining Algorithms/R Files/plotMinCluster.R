plotMSD<-function(dataframe,startIndex,endIndex,clusterNo){
  a=c()
  for(i in 1:(clusterNo-1)){
  a<-c(a,(sum(kmeans(genere_df[startIndex:endIndex],i)$withinss)-sum(kmeans(genere_df[startIndex:endIndex],i+1)$withinss)))
  b<-length(a)
  c<-1:b
  plot(c,a,main="Difference in sum of intra block distance ")
  }
}



makefactor <- function(dataframe){
  noCol<-ncol(dataframe)
  for (i in 1:noCol){
   dataframe[,i] <-as.factor(dataframe[,i])
  }
  return(dataframe)
}