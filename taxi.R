# euclid count distance between taxi and passageres
# iGorodskov 
tax<-data.frame(cbind(x=runif(40), y=runif(40))) #taxi black
pa<-data.frame(cbind(x=runif(40), y=runif(40)))  #passagire red
plot(tax)
points(pa, col="red")
for(m in c(1:nrow(pa))) {
  
  if(pa$x[m] != 100.0 && min(tax$x) < 100.0){
    l<-c(sqrt((tax$x-pa$x[m])^2) + sqrt((tax$y-pa$y[m])^2));
    lines(c(tax$x[which.min(l)], pa$x[m]), c(tax$y[which.min(l)], pa$y[m]), col="green");
    pa$x[m]<-100.0;
    tax$x[which.min((l))]<-100.0;
  }
}
