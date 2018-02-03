library(RODBC)
co<-odbcConnect("BCC")
ds <-sqlQuery(co, "select * from PS where D_PS >'20151031'")
d<- subset (ds, is.na(DEL_FLAG), c(N_PS,D_PS)) 

substr(d$N_PS,20,20)  --20 only start-stop

