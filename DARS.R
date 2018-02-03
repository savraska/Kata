C:\\dars.net\\oplataload.rpt.xls

library(xlsx)
m<- read.xlsx("C:\\dars.net\\oplataload.rpt.xls",1, startRow=2)

m<- m[m$UPLOAD_CASE == "R_FCY#2",]

m <- m[-grep('70TN',m$N_REFER),]

m <- m[m$BRANCH_NO == 0,]


//vkovnazcti0022/CCUS/BA/Intranet/swiftdb/db/db.mdb

m[is.na(m)]<-0    # change all NA to 0
