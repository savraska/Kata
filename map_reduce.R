library("data.table")
d<-fread("/home/savraska/Schreibtisch/data/integer/train.csv", stringsAsFactors=F)
s<-strsplit(d$Sequence,",")

zz<-data.frame()
for (i in(1:2000)){
    m<-as.vector(as.numeric(unlist(s[i])))
    zz<-rbind(zz, as.data.frame(table(m)))
}


#simpler
mm<-c()
for (i in c(1:3000))
    {
    m<-as.vector(as.numeric(unlist(s[i])))
    mm<-c(mm,m)
}
table(mm)