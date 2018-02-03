library("xlsx")
x<-read.xlsx("\\\\vkovnazcti0022\\ccus\\BA\\GTS_Statistics\\CCUStatistics.xlsx",2)

2- second worksheet
x[,321] - May09-15 from 2016

na.omit(x[4,2:321]) - total

na.omit(x[25,2:321]) - PS export

x<-read.xlsx2("\\\\vkovnazcti0022\\ccus\\BA\\GTS_Statistics\\CCUStatistics.xlsx",2, stringsAsFactors=F)


 x<-read.xlsx2("\\\\vkovnazcti0022\\ccus\\BA\\GTS_Statistics\\CCUStatistics.xlsx",sheetIndex=2, header = F, stringsAsFactors=F, rowIndex=25, colIndex=c(2:321))



PS Export
 x<-read.xlsx("\\\\vkovnazcti0022\\ccus\\BA\\GTS_Statistics\\CCUStatistics.xlsx",sheetIndex=2, header=F, as.data.frame=F, startRow=26, endRow=26)
v<-as.vector(na.omit(as.numeric(x)))

plot(v)


PS Import
> y<-read.xlsx("\\\\vkovnazcti0022\\ccus\\BA\\GTS_Statistics\\CCUStatistics.xlsx",sheetIndex=2, header=F, as.data.frame=F, startRow=28, endRow=28)
> 

lines(v)
lines(y1, col="red")

anomaly detection 
v[abs(v-mean(v)) > sd(v[v<1000])*3]
y1[abs(y1-mean(y1)) > sd(y1[y1<1000])*3]

PS Loan
 z<-read.xlsx("\\\\vkovnazcti0022\\ccus\\BA\\GTS_Statistics\\CCUStatistics.xlsx",sheetIndex=2, header=F, as.data.frame=F, startRow=30, endRow=30)

z1<-as.vector(na.omit(as.numeric(z)))

v2<-sapply(v1,function(x){(x-min(v1))/(max(v1)-min(v1))})
y2<-sapply(y1,function(x){(x-min(y1))/(max(y1)-min(y1))})
z2<-sapply(z1,function(x){(x-min(z1))/(max(z1)-min(z1))})

and only after scale look at anomaly, specially without same pattern for other PSs


v2[abs(v2-mean(v2)) > sd(v2[v2<1000])*3]
z2[abs(z2-mean(z2)) > sd(z2[z2<1000])*3]

' outlier points
y3<-y2
y3[abs(y3-mean(y3)) < sd(y3)*3]<-0
plott(y2)
> points(v3,pch=23, bg="blue", col="blue")
> points(z3, pch=23,bg="red", col="red")
> points(y3, pch=23,bg="green", col="green")


