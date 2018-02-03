library(data.table)
a<-fread("//vkovnazcti0022/CCUS/BA/igor_processing/cubos_errors/err_db.txt", sep=";",header=F, stringsAsFactors=F)


library(stringr)
table(paste(na.omit(str_extract(a$V3,'[0-9]{12}')),''))


tokens<-as.data.frame(table(paste(na.omit(str_extract(a$V3,'[0-9]{12}')),'')))


#Time for token process:

as.data.frame(table(na.omit(str_extract(a[grep('[0-9]{12}',a$V3),]$V3, '00:00:[0-9]{2}.'))))


delete first row  in ds
z<-z[-1,]

replace point
z$Var1<-str_replace(z$Var1,'[.]','')

z$Var1<-str_replace(z$Var1,'00:00:','')

total by rows
 zz<-as.numeric(z[,1]) * as.numeric(z[,2])


#count sum of seconds

m=0
for (i in 1:length(zz)) {m=m+zz[i]}
m

#or all rows by one command:

as.numeric(z$Var1) %*% as.numeric(z[,2])



xtabs (~a$V5 + a$V1, data=a)