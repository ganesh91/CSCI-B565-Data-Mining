library(corrplot)
tuneds <- read.csv("genresTrain.csv")
num.tuneds<- tuneds[-192]
cor.tune <- cor(num.tuneds)
cor.upper.tune <- cor.tune
cor.upper.tune[lower.tri(cor.upper.tune)] <- 0
cor.upper.tune[cor.upper.tune]
diag(cor.upper.tune) <- 0
cno <- which(cor.upper.tune == 1,arr.ind = TRUE)
cno1 <- which(cor.upper.tune > 0.9,arr.ind = TRUE)
tune.ds <- tuneds[,c(cno[,2],cno1[,2])*-1]
unique(tune.ds[,147])

normalize <- function(df){
  v_cols<-ncol(df)
  df_normalized <- df
  for (i in 1:v_cols){
    df_normalized[,i]<-(df_normalized[,i]-mean(df_normalized[,i]))/sd(df_normalized[,i])
  }
  return(df_normalized)
}

df_norm.tune <- normalize(tune.ds[-147])
df_norm.tune["GENRE"]<-tune.ds[147]

library(e1071)
s<-naiveBayes(GENRE~.,data=tune.ds)
table(predict(s,tune.ds),tune.ds[,147])

trainds <- read.csv("genresTest.csv")
c_train.ds <- trainds[,c(cno[,2],cno1[,2])*-1]
baseline<-read.csv("genresBaseline.txt")
table(predict(s,c_train.ds[-1,]),baseline[,1])
