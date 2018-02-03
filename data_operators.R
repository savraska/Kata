first 5 rows
iris[1:5,]

first 3 columns
iris[,1:3]

all data with setosa in 5 column
a<-iris[iris[5]=="setosa",]

rows if column 1 > 6
iris[iris[1]>6,]

first row
iris[1,,]

first 2 rows (no metter order)
iris[2:1,]

qty rows, columns
> dim(iris)
[1] 150   5

not like setosa
iris[iris[5]!="setosa",]

1 column > 7 OR 2 column > 3
iris[iris[1]> 7 | iris[2]>3,]

1 col > 6 AND 2 col > 3
iris[iris[1]> 6 & iris[2]>3,]


5 col like "osa"
iris[grep("osa", iris$Species), ]

same with "virg"
iris[grep("virg", iris[,5]),]

same with sqldf
sqldf("select * from iris where Species like '%set%'")