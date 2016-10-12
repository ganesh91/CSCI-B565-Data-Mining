#This program creates the CSV files for data ingestion. 
#The data frame is converted to an CSV file, which is loaded to database using ETL 
Genere<-c("Romance","Science  Fiction","Horror","Comedy","Drama","Action",
          "Documentary","Classic")
Code<-c("r","s","h","c","d","a","o","l")
DC<-as.data.frame(cbind(Genere,Code))

mv1<-c("1","r","s",NA,NA)
mv2<-c("2","o","l","a",NA)
mv3<-c("3","c","d","h",NA)
mv4<-c("4","s","l","o","a")
mv5<-c("5","a","d","r",NA)
mv6<-c("6","d","h","c",NA)
mv7<-c("7","a","d","c","o")
mv8<-c("8","h","l","r",NA)
mv9<-c("9","s","d",NA,NA)
mv10<-c("10","c","r",NA,NA)
MIDG<-as.data.frame(rbind(mv1,mv2,mv3,mv4,mv5,mv6,mv7,mv8,mv9,mv10))
colnames(MIDG)<-c("Mv_ID","G1","G2","G3","G4")

C1<-c("CID1","CID2","CID3","CID4","CID5","CID6","CID7","CID8","CID9","CID10",
      "CID11","CID12","CID13","CID14")
C2<-c(1,4,7,2,4,3,1,5,10,2,1,3,8,5)
C3<-c(3,1,8,NA,8,9,2,4,1,4,10,5,1,2)
C4<-c(5,2,1,NA,10,10,3,9,2,3,8,1,7,8)
C5<-c(5,3,NA,NA,NA,1,NA,5,23,7,NA,2,NA,NA)
C6<-c(10,NA,NA,NA,NA,NA,NA,NA,NA,9,NA,NA,NA,NA)
c7<-c(8,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA)
CIDM<-as.data.frame(cbind(C1,C2,C3,C4,C5,C6,c7))

write.csv(CIDM,"CIDM.csv")
write.csv(DC,"DC.csv")
write.csv(MIDG,"MIDG.csv")