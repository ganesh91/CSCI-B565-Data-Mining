library(cluster)
library(corrplot)
library(arules)
library(arulesViz)
library(class)
library(e1071)
library(RMySQL)
library(ggplot2)



sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select * from cluster_genere")
genere_df = fetch(rs, n=-1)
rs = dbSendQuery(sqldb, "select * from cluster_movie")
movie_df = fetch(rs, n=-1)

#Replace 0 by a infinitely minimal value
replaceZeroes<-function(dataframe){
  i=ncol(dataframe)
  for (j in 1:i){
    temp<-dataframe[,i]
    temp[temp==0]<-1^-10
    dataframe[,i]<-temp
  }
}

#Call K Means for genere with cluster size 3
clust_genere<-kmeans(genere_df[2:9],3,iter.max = 10)
clusplot(genere_df[2:9],clust_genere$cluster,color=TRUE,shade=TRUE,labels=2,lines=0,main="Cluster Visualization by Genere")
clust_genere$cluster


plotMinIntra(genere_df,2,9,9,4)
plotMinIntra(movie_df,2,10,11,4)

#No one has seen movie 6. remove movie 6 from the list
movie_df<-movie_df[,-7]
tocl_movie_df<-movie_df[,-8]
#Remove Labels
tocl_movie_df<-tocl_movie_df[,-1]
#Retry finding best clusters
plotMinIntra(tocl_movie_df,1,8,5,4)
clust_movie<-kmeans(tocl_movie_df,3)
clusplot(tocl_movie_df,clust_movie$cluster,color=TRUE,shade=TRUE,labels=2,lines=0,main="Cluster Visualization by Film")

#Load Data for association rules
library(RMySQL)
sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select * from cust_film")
genere_df = fetch(rs, n=-1)
rs = dbSendQuery(sqldb, "select * from cust_movie")
movie_df = fetch(rs, n=-1)

#Remove the movie id and convert the rest to factors.
genere_df<-genere_df[-2]
genere_df[,1]<-as.factor(genere_df[,1])
genere_df[,2]<-as.factor(genere_df[,2])

#Convert the data frame to transcation
write.table(genere_df,"transactions_genere.csv",row.names = FALSE,col.names = FALSE,sep = ",")
#Manually replaced quotes
txn_genere<-read.transactions(file="transactions_genere.csv",format = "single",sep=",",rm.duplicates=TRUE,cols=c(1,2))
inspect(txn_genere)
ru_genere<-apriori(txn_genere,parameter = list(supp=0.7,conf=1,target="rules"))
inspect(ru_genere)
plot(ru_genere,method="graph",control=list(type="items"))
plot(ru_genere,method="grouped")

#By Film
movie_df[,1]<-as.factor(movie_df[,1])
movie_df[,2]<-as.factor(movie_df[,2])
write.table(movie_df,"transactions_film.csv",row.names = FALSE,col.names = FALSE,sep = ",")
#Manually replaced quotes
txn_film<-read.transactions(file="transactions_film.csv",format = "single",sep=",",rm.duplicates=TRUE,cols=c(1,2))
inspect(txn_film)
ru_film<-apriori(txn_film,parameter = list(supp=0.2,conf=0.5,target="rules"))
inspect(ru_film)
plot(ru_film,method="graph",control=list(type="items"))
plot(ru_film,method="grouped")

#K-Nearest Neibhours
#Load the values
sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select * from cluster_genere")
genere_df = fetch(rs, n=-1)
rs = dbSendQuery(sqldb, "select * from cluster_movie")
movie_df = fetch(rs, n=-1)
movie_test<-as.data.frame(as.matrix(t(c(0,0,1,0,0,1,0,0,1,1,0))))
movie_test[1]=as.factor(c("NA"))
movie_df[,1]<-as.factor(movie_df[,1])
colnames(movie_test)<-colnames(movie_df)
require(class)
ru_knn<-knn(movie_df[-1],movie_test[,-1],movie_df[,1],k=3,prob = TRUE)