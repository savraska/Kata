a[grep('^8',a$telex),] - starts with 8
head(a[grep('^77',a$telex),]) - starts with 77
head(a[grep('4$',a$telex),])  - end on 4 

head(a[grep('^7[8-9]',a$telex),]) 78 and 79
head(a[grep('[[:alnum:]]',a$telex),]) - all numbers same as  head(a[grep('[[:digit:]]',a$telex),])

a$telex[grep('7+77',a$telex)] 77 and one more 7 in telex:
700777, 777777, 501777




grep('pay', tolower(f$Type)) - positions
f[grep('pay', tolower(f$Type)),] - names

sum(f[grep('pay', tolower(f$Type)),2]) - sum of 2 column
or
sum(z[grep('pay', z$Type, ignore.case=TRUE),2])


z<-aggregate (Amount ~ Type, data=a[a$EndDate=='2014-10-19' & substr(a$telex,1,1) != '1',], FUN=sum) - delete non-residents for GTS sts


z[grep('pay', z$Type, ignore.case=TRUE), ]

z[grep('doc', z$Type, ignore.case=TRUE),]
sum(z[grep('Inquiries', z$Type, ignore.case=TRUE),2])
sum(z[grep('FX', z$Type, ignore.case=TRUE),2])
sum(z[grep('405', z$Type, ignore.case=TRUE),2]) + sum(z[grep('402', z$Type, ignore.case=TRUE),2]) + sum(z[grep('652', z$Type, ignore.case=TRUE),2])
sum(z[grep('calls', z$Type, ignore.case=TRUE),2])
sum(z[grep('investigations', z$Type, ignore.case=TRUE),2])
sum(z[grep('export passports', z$Type, ignore.case=TRUE),2])
sum(z[grep('import passports', z$Type, ignore.case=TRUE),2])
sum(z[grep('loan passports', z$Type, ignore.case=TRUE),2])


z[grep('Export passport Payments$', z$Type, ignore.case=TRUE),]   -- $ is end of line
sum(z[grep('export passport payments$', z$Type, ignore.case=TRUE),2])
sum(z[grep('import passport payments$', z$Type, ignore.case=TRUE),2])

sum(z[grep('non-passport', z$Type, ignore.case=TRUE),2])
sum(z[grep('export passport doc', z$Type, ignore.case=TRUE),2])
sum(z[grep('import passport doc', z$Type, ignore.case=TRUE),2])



"Export passport payments" Or "Import passport payments" Or "Loan passport payments FCY" Or "Loan passport payments LCY - 1" Or "Loan passport payments LCY - 2" Or "Non-passport resident payments FCY" Or "Non-passport resident payments LCY - 1" Or "Non-passport resident payments LCY 2" Or "FX"