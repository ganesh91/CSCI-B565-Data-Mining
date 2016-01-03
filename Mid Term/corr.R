sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select movie_id,genere from cust_film;")
genere_df = fetch(rs, n=-1)
genere_df=as.data.frame(lapply(genere_df,as.factor))
fit<-naiveBayes(movie_id~.,data=genere_df,laplace = 3)
predict(fit,genere_df[1,1],type=c("class","raw"))

cor(cbind(c(1,0,0.5),c(0,1,0)))
cor(cbind(c(1,0,0.5,1,0,0.5),c(0,1,0,0,1,0)))