#Program : 3
#This program does a K-Means for the customer vs film & Genere.
#This retrieves the data frames from data bases and does k-Means

#--Libraries--
library(RMySQL)
library(corrplot)

##--Diagnostoc functions : To predict the best k--------
plotMinIntra<-function(dataframe,startIndex,endIndex,clusterNo,iterationNo){
  par(mfrow=c(floor(iterationNo/2),floor(iterationNo/2)),mar=c(2,2,2,2))
  for(j in 1:iterationNo){
    nos<-1:clusterNo
    sum_v=c()
    for(i in 1:clusterNo){
      sum_v<-c(sum_v,sum(kmeans(dataframe[startIndex:endIndex],i)$withinss))
    }
    plot(nos,sum_v,main="Intrablock Dist Vs # of Blocks",xlab = "# cluster",
         ylab = "Sum of Intrablock Distance",type="o")
  }
}
#---------------------

sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',
                host='localhost')
rs = dbSendQuery(sqldb, "select * from cluster_genere")
genere_df = fetch(rs, n=-1)
rs = dbSendQuery(sqldb, "select * from cluster_movie")
movie_df = fetch(rs, n=-1)

#Determine K
plotMinIntra(genere_df,2,9,9,4)

#Call K Means for genere with cluster size 3
clust_genere<-kmeans(genere_df[2:9],3,iter.max = 10)
clusplot(genere_df[2:9],clust_genere$cluster,color=TRUE,shade=TRUE,
         labels=2,lines=0,main="Cluster Visualization by Genere")
clust_genere$cluster

#plot Corrplots
#No one has seen movie #7
movie_df<-movie_df[,-7]
corrplot(cor(movie_df[-1]),method=c("number"))
corrplot(cor(movie_df[-1]),method=c("square"))

#column 8 and 9 have same corelation. Remove Col9
tocl_movie_df<-movie_df[,-8]
#Remove Labels
tocl_movie_df<-tocl_movie_df[,-1]
#Retry finding best clusters
plotMinIntra(tocl_movie_df,1,8,5,4)
clust_movie<-kmeans(tocl_movie_df,3)
clusplot(tocl_movie_df,clust_movie$cluster,color=TRUE,shade=TRUE,
         labels=2,lines=0,main="Cluster Visualization by Film")
