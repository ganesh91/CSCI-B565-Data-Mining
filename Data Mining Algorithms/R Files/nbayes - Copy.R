#bayes with test and train dataset
library(RMySQL)
sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select 	mv_id,sum(case when genere='Romance' then 1 else 0 end) 'Romance',
sum(case when genere='Science  Fiction' then 1 else 0 end) 'SciFi',
                 sum(case when genere='Horror' then 1 else 0 end) 'Horror',
                 sum(case when genere='Comedy' then 1 else 0 end) 'Comedy',
                 sum(case when genere='Drama' then 1 else 0 end) 'Drama',
                 sum(case when genere='Action' then 1 else 0 end) 'Action',
                 sum(case when genere='Documentary' then 1 else 0 end) 'Documentary',
                 sum(case when genere='Classic' then 1 else 0 end) 'Classic'
                 from movie_genere group by mv_id order by mv_id;")
ctGenere_df = fetch(rs, n=-1)
ctGenere_df["Views"]<-NA
rs = dbSendQuery(sqldb,"select movie_id 'mv_id',count(movie_id) 'count' from cust_movie group by movie_id order by mv_id;")
ctViews_df = ctGenere_df = fetch(rs, n=-1)
ctGenere_df[,10]<-ctViews_df[,2]
#Normalize Views
normalize <-function(x){
num <- x-min(x)
denom <- max(x)-min(x)
return (num/denom)
}
nmgenre_df<-as.data.frame(lapply(ctGenere_df[-1],normalize))
nmgenre_df["mv_id"]<-NA
nmgenre_df[,10]<-as.factor(ctGenere_df[,1])

#Create Naive Bayes Predictor

model<-naiveBayes(mv_id~.,data=nmgenre_df)
predict(model,nmgenre_df[1:8])
