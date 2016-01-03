#bayes with test and train dataset
library(RMySQL)

#Retrieve Dataset
sqldb=dbConnect(MySQL(),user='apps',password='',dbname='test',host='localhost')
rs = dbSendQuery(sqldb, "select movie_id,genere from cust_film;")
genere_df = fetch(rs, n=-1)

#Make Factors
genere_df=as.data.frame(lapply(genere_df,as.factor))

#Train a Bayesian Classifier
fit<-naiveBayes(movie_id~.,data=genere_df,laplace = 3)

#Predict the test dataset
predict(fit,as.factor(c("Action","Drama")))
