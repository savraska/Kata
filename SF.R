library(data.table)
a<- fread("i:/Documents/R/SF/train.csv",sep=",", header=T, stringsAsFactors=F)


n<-naiveBayes(Category ~ DayOfWeek, data= b)

t<- as.data.frame(n$table)

xtabs(t$pro ~  t$type +  t$dw)