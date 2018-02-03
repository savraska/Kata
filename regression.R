dot<-function (a,b){
  if (length(a)==length(b))
  {
    return (sum(a*b))
  }
}
# function can be replaced by   %*% 
x<-rnorm(20)
y<-rnorm(20)

denominator<- dot(x,x)-mean(x)*sum(x)
a<-(dot(x,y)-mean(y)*sum(x))/denominator           # x
b<-(mean(y)*dot(x,x)-mean(x)*dot(x,y))/denominator # (Intercept) 

Yhat <- a*x + b
a
b
summary(lm(y~x))
# count R2
d1<-y-Yhat
d2<-y-mean(y)
r2<-1-dot(d1,d1)/dot(d2,d2)
r2 # Multiple R-squared

