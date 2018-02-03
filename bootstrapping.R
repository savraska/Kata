бутсреп считает доверительные интервалы и проверяет гипотезы если распределение неизвестно, есть вбросы, нет достаточного размеры выборки и нет параметрического метода.

library(boot)

#formula for boot func

> bs <-function(formula, data, indices) {
d<-data[indices,]
+ fit<-lm(formula, data=d)
+ return(coef(fit))
}

> r<-boot(data=mtcars, statistic = bs, R=100, formula=mpg~wt+disp)

> print(r)

ORDINARY NONPARAMETRIC BOOTSTRAP


Call:
boot(data = mtcars, statistic = bs, R = 100, formula = mpg ~ 
    wt + disp)


Bootstrap Statistics :
       original        bias    std. error
t1* 34.96055404  0.0545345499 2.540969751
t2* -3.35082533 -0.0190386167 1.162623249
t3* -0.01772474 -0.0005314573 0.009145325

plot(r)

##       доверительный интервал
index= 1 свободный член, 2 - вес авто, 3 - объем цилиндров

> boot.ci(r, type="bca", index=2)
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 100 bootstrap replicates

CALL : 
boot.ci(boot.out = r, type = "bca", index = 2)

Intervals : 
Level       BCa          
95%   (-5.568, -1.068 )  
Calculations and Intervals on Original Scale
Some BCa intervals may be unstable