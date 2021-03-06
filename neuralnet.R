library(neuralnet)
attribute<-as.data.frame(sample(seq(-2,2,length=50),50, replace=F), ncol=1)
response<-attribute ^2-1
data<-cbind(attribute, response)
colnames(data)<-c("a","r")
fit<-neuralnet(r~a, data=data, hidden = c(3,3), threshold = 0.01)
testdata<-as.matrix(sample(seq(-2,2, length.out =50),50, replace=F),ncol=1)
pred<-compute(fit, testdata)
result<-cbind(testdata, pred$net.result, testdata^2-1)
colnames(result)<-c("Attribute","Prediction","Actual")
round(result,4)
plot(result[,2])
lines(result[,2],col="blue")
lines(result[,3],col="red")