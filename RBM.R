library(RcppDL)
library("ltm") # for mobility ds
data(Mobility)
data<-Mobility
n<-nrow(data)
sample<-sample(1:n,1000,F)
data<-as/matrix(Mobiliy[sample,])
n<-nrow(data)
train <-sample(1:n,800,F)
x_train<-matrix(as.numeric(unlist(data[train,])), nrow=nrow(data[train,]))
x_test <-matrix(as.numeric(unlist(data[-train,])), nrow =nrow(data[-train,]))

x_train<-x_train[,-c(4,6)]
x_test<-x_test[,-c(4,6)]


fit<-Rrbm(x_train)

setHiddenRepresentation(fit,x=3) # 3 hidden nodes
setLearningRate(fit, x=0.01)

summary(fit)

train(fit)

# reconstruct original values
reco <-reconstruct(fit, x_train)
recon<-ifelse(reco>=0.5,1,0)
head(recon)

table(recon, x_train, dnn=c("Predicted","Observed"))

par(mfrow=c(1,2))
image(x_train, main="Train")
image(recon,main="Reconstructed")

# 2 way for Bolzmann
library(deepnet)
fit2<-rbm.train(x_train, hidden=3,
                numepochs=3, batchsize=100, learningrate=0.8,
                learningrate_scale=1, momentum=0.5, visible_type="bin",
                hidden_type="bin", cd=1)