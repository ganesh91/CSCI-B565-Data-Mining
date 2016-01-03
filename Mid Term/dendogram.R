#
library(RMySQL)

#Retieve data from the database
sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select * from cluster_genere")
genere_df = fetch(rs, n=-1)

#Transpose the dataframe maiking genere as rows
data<-as.data.frame(t(genere_df))
data<-data[-1,]

#Find the distance matrix
d <- dist(data, method = "euclidean")

#Fit this to the agglomerative clustering algorithm
#Both Ward.D mehod and un-weighed average method was used.
fit <- hclust(d, method="ward.D")
plot(fit,xlab="Genere")
fit <- hclust(d, method="average")
plot(fit,xlab="Genere")

