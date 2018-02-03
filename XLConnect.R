# можно быстро чекнуть есть ли повторения 
library(XLConnect)
w<- loadWorkbook("//vkovnazcti0022/ccus/BA/Commissions/Standard/comm_201607.xlsx")
s<-readWorksheet(w,sheet=3, header=T)
length(unique(s$N_REFER))-length(s$N_REFER)
s<-readWorksheet(w,sheet=4, header=T)
length(unique(s$N_REFER))-length(s$N_REFER)
s<-readWorksheet(w,sheet=5, header=T)
length(unique(s$N_REFER))-length(s$N_REFER)

# посмотреть в CSV сколько должно быть уникальных рефов в 5USD and LP


f1<- "//vkovnazcti0022/ccus/BA/igor_processing/commisions_OLD/OUT/5USD_EXPORT_MSK.CSV"
f2<- "//vkovnazcti0022/ccus/BA/igor_processing/commisions_OLD/OUT/5USD_IMPORT_MSK.CSV"
f3<- "//vkovnazcti0022/ccus/BA/igor_processing/commisions_OLD/OUT/LP_MSK.CSV"

f<-read.table(f1, sep=";", header=T)
length(unique(f$N_REFER))

f<-read.table(f2, sep=";", header=T)
length(unique(f$N_REFER))

f<-read.table(f3, sep=";", header=T)
length(unique(f$N_REFER))

# convert account from e to normal digits
options(digits=20)
as.numeric(f$N_SCHET[1]) 
f$N_SCHET<- as.character(as.numeric(f$N_SCHET))
options(digits=5)

