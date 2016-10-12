#Program4: Association Rules
library(arules)
library(arulesViz)
library(RMySQL)

#Retrieve data from database
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
write.table(genere_df,"transactions_genere.csv",row.names = FALSE,
            col.names = FALSE,sep = ",")
#Manually replaced quotes
txn_genere<-read.transactions(file="transactions_genere.csv",
            format = "single",sep=",",rm.duplicates=TRUE,cols=c(1,2))
inspect(txn_genere)
ru_genere<-apriori(txn_genere,parameter = list(supp=0.7,conf=1,target="rules"))
inspect(ru_genere)
plot(ru_genere,method="graph",control=list(type="items"))
plot(ru_genere,method="grouped")

#For association by film:
movie_df[,1]<-as.factor(movie_df[,1])
movie_df[,2]<-as.factor(movie_df[,2])
write.table(movie_df,"transactions_film.csv",row.names = FALSE,
            col.names = FALSE,sep = ",")
#Manually replaced quotes
txn_film<-read.transactions(file="transactions_film.csv",format = "single",
                            sep=",",rm.duplicates=TRUE,cols=c(1,2))
inspect(txn_film)
ru_film<-apriori(txn_film,parameter = list(supp=0.2,conf=0.5,target="rules"))
inspect(ru_film)
plot(ru_film,method="graph",control=list(type="items"))
plot(ru_film,method="grouped")