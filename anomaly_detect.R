z[sapply(z$Amount, function(x) {abs(x - mean(z$Amount) )})> (sd(z$Amount) *3),]


data.table
zz<-z[,.(ss=sd(Amount)*3, avg=mean(Amount)), by=Type]