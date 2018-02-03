library(data.table)

library(data.table)

a<-fread ("c:\\temp\\Volumes.txt", sep=";", header=T, stringsAsFactors=T)
a$StartDate <- as.Date(unlist(a$StartDate),format="%d.%m.%Y")
a$EndDate <- as.Date(unlist(a$EndDate),format="%d.%m.%Y")

b<-fread ("c:\\temp\\vol08-13.txt", sep=";", header=T, stringsAsFactors=T)
b$StartDate<- as.Date(b$StartDate,format="%Y-%m-%d")
b$EndDate<- as.Date(b$EndDate,format="%Y-%m-%d")

l<-colnames(b)[-c(6:7,9)]
for (i in 1:length(l)){b[[l[i]]] <-factor(b[[l[i]]])}

l<-colnames(a)[-c(6:7,9)]
for (i in 1:length(l)){a[[l[i]]] <-factor(a[[l[i]]])}


d<-rbind(a,b)




a<- read.table ("i:/Documents/Volumes.csv", sep=";", header=TRUE, stringsAsFactor=FALSE)

a$StartDate <- strptime(strsplit(a$StartDate,"00:00:00"), format="%d.%m.%Y")
a$EndDate <- strptime(strsplit(a$EndDate," 0:00:00"), format="%d.%m.%Y")

a[a$type=='FX_old',]$Type='FX'


a$StartDate <-strsplit(a$StartDate,'00:00:00')
a$EndDate <-strsplit(a$EndDate,'00:00:00')

#with space
a$D_SPR_PRED<- strsplit(as.character(a$D_SPR_PRED),'0:00:00 ')
a$D_PLAT<- as.Date(as.character(a$D_PLAT),format='%d.%m.%Y')

or:
a$D_REFER<- strsplit(as.character(a$D_REFER),' ')
a$D_REFER<- as.Date(as.character(a$D_REFER),format='%d.%m.%Y')


a$Type <- factor(a$Type)


> a$EndDate<- strptime(a$EndDate,"%d.%m.%Y")
> a$StartDate<- strptime(a$StartDate,"%d.%m.%Y")


b<- aggregate (Amount ~ Type + Year + Month_ISO, data=a, FUN=sum)


b<- read.table ("I:/Documents/Volumes_OLD.txt", sep=";", header=TRUE)

c<-rbind(a,b)

aggregate(c$Amount ~ c$Year, FUN=sum)

aggregate(c$Amount ~ c$Type + c$Year, FUN=sum)


aggregate( b[b$Year=='2014' & b$Month_ISO =='4',]$Amount ~ b[b$Year=='2014' & b$Month_ISO =='4',]$Week, FUN =sum)


options(digits= 12) - big digits
options(scipen=100) - get rid of N_SCHET e+19 format


a<- read.table("\\\\vkovnazcti0022\\CCUS\\BA\\igor_processing\\commisions_OLD\\SQL\\OLD_FOR_CHECK\\payments.txt",sep=";", header = TRUE, stringsAsFactor=FALSE)

a$D_REFER <- strptime(strsplit(a$D_REFER,' 0:00:00'), format='%d.%m.%Y')
a$D_PLAT <- strptime(strsplit(a$D_PLAT,' 0:00:00'), format='%d.%m.%Y')
a$D_SPR_PRED <- strptime(strsplit(a$D_SPR_PRED,' 0:00:00'), format='%d.%m.%Y')


