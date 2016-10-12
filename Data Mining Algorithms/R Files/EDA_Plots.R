library(ggplot2)
library(reshape2)
library(RSQLite)
plot(genere_df[-1])
plot.df<-melt(genere_df,id="cust_id")
qplot(cust_id,facets = ,data=genere_df)+geom_histogram()
ggplot(plot.df,aes(x=cust_id,y=value,color=variable,fill=variable))+facet_grid(variable~.)+stat_summary(fun.y="mean",geom="bar")


sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select genere,count(genere) 'Views' from cust_film group by genere order by Views desc;")
plot_df1 = fetch(rs, n=-1)
rs = dbSendQuery(sqldb, "select movie_id,count(movie_id) 'Views' from cust_film group by movie_id order by Views desc;")
plot_df2 = fetch(rs, n=-1)

ggplot(plot_df1,aes(x=genere,y=Views,color=genere,fill=genere))+stat_summary(fun.y="mean",geom="bar")
plot_df2[,1]<-as.factor(plot_df2[,1])
ggplot(plot_df2,aes(x=movie_id,y=Views,color=movie_id,fill=movie_id))+stat_summary(fun.y="mean",geom="bar")

