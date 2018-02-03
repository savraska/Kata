aggregate(iris$Petal.Width ~ iris$Species, FUN= median)

iris$Petal.Width - field to count or cbind(field, field...)
iris$Species - group by

Volumes: 
aggregate(a$Amount ~ a$Type, FUN=sum)