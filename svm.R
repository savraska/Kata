m<-svm(Species~., data =iris)

p<-predict(m, iris[1:4])
table(p,iris[,5])

t<-tune(svm,train.x=iris[1:4], train.y=iris[,5], kernel="radial", ranges=list(cost=c(.1,.5,.7,1,10,20), gamma=c(.1,.2,.5,1,2, 3)))
summary(t)
#best parameters for cost and gamma
m2<-svm(Species~., data =iris, kernel="radial", cost=20, gamma=0.1)