#Program 4: K-Nearest Neibhour
library(class)
library(e1071)
library(RMySQL)
library(cluster)

#Retrieve Dataframes from Database
sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select * from cluster_genere")
genere_df = fetch(rs, n=-1)
rs = dbSendQuery(sqldb, "select * from cluster_movie")
movie_df = fetch(rs, n=-1)

#Create Test Dataset
movie_test<-as.data.frame(as.matrix(t(c(0,0,1,0,0,1,0,0,1,1,0))))
movie_test[1]=as.factor(c("NA"))

#Refactor customer name as factor
movie_df[,1]<-as.factor(movie_df[,1])
colnames(movie_test)<-colnames(movie_df)

#Run K-nn algorithm
ru_knn<-knn(movie_df[-1],movie_test[,-1],movie_df[,1],k=3)
#Print Output
ru_knn