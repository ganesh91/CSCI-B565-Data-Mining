vectorize.medpolish<-function(residuals.mp){
  residualslist <- c(residuals.mp)
  residuals.ret <- c()
  for (i in 1:nrow(residuals.mp)){
    residuals.ret <- rbind(residuals.ret,c(sample(residualslist,ncol(residuals.mp),replace = TRUE)))
  }
  return (residuals.ret)
}


bootstrap.medpolish<-function(mat,sims){
  nrows <- nrow(mat)
  ncols <- ncol (mat)
  row.est <- matrix(0,nrow=sims,ncol=nrows)
  col.est <- matrix(0,nrow=sims,ncol=ncols)
  overall.est <- c()
  org.result<-medpolish(mat)
  sample.mat <- org.result$residuals
  sample.result <- org.result
  for (j in 1:sims){
    new.residuals <- vectorize.medpolish(sample.mat)
    bs.mat <- new.residuals+t(rbind(sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row,sample.result$row))+sapply(c(sample.result$col),function(x) rep(x,nrow(sample.result$residuals)))+matrix(sample.result$overall,nrow=length(sample.result$row),ncol=length(sample.result$col))
    sample.result <- medpolish(bs.mat,maxiter = 1000)
    sample.mat<-sample.result$residuals
    #print(row.est[j,])
    #print(bs.mat)
    #print(c(sample.result$row))
    row.est[j,]<-c(sample.result$row)
    col.est[j,]<-c(sample.result$col)
    overall.est[j]<-sample.result$overall
  }
  return(list(row.est=row.est,col.est=col.est,overall.est=overall.est))
}

b<-bootstrap.medpolish(df,50)

overall.serror<-sd(b$overall.est)/sqrt(length(df))
print(paste("Bootstrap Estimates for overall : ",mean(b$overall.est)))
print(paste("The standard error of Bootstrap Estimates",overall.serror))