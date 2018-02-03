#source("RFunctions-1.R")
# Define the sigmoid function
sigmoid <- function(z){
    a <- 1/(1+ exp(-z))
    a
}

# Compute the loss
computeLoss <- function(numTraining,Y,A){
    loss <- -1/numTraining* sum(Y*log(A) + (1-Y)*log(1-A))
    return(loss)
}

# Compute forward propagation
forwardPropagation <- function(w,b,X,Y){
    # Compute Z
    Z <- t(w) %*% X +b
    #Set the number of samples
    numTraining <- ncol(X)
    # Compute the activation function
    A=sigmoid(Z) 
    
    #Compute the loss
    loss <- computeLoss(numTraining,Y,A)
    
    # Compute the gradients dZ, dw and db
    dZ<-A-Y
    dw<-1/numTraining * X %*% t(dZ)
    db<-1/numTraining*sum(dZ)
    
    fwdProp <- list("loss" = loss, "dw" = dw, "db" = db)
    return(fwdProp)
}

# Perform one cycle of Gradient descent
gradientDescent <- function(w, b, X, Y, numIerations, learningRate){
    losses <- NULL
    idx <- NULL
    # Loop through the number of iterations
    for(i in 1:numIerations){
        fwdProp <-forwardPropagation(w,b,X,Y)
        #Get the derivatives
        dw <- fwdProp$dw
        db <- fwdProp$db
        #Perform gradient descent
        w = w-learningRate*dw
        b = b-learningRate*db
        l <- fwdProp$loss
        # Stoe the loss
        if(i %% 100 == 0){
            idx <- c(idx,i)
            losses <- c(losses,l)  
        }
    }
    
    # Return the weights and losses
    gradDescnt <- list("w"=w,"b"=b,"dw"=dw,"db"=db,"losses"=losses,"idx"=idx)
   
    return(gradDescnt)
}

# Compute the predicted value for input
predict <- function(w,b,X){
    m=dim(X)[2]
    # Create a ector of 0's
    yPredicted=matrix(rep(0,m),nrow=1,ncol=m)
    Z <- t(w) %*% X +b
    # Compute sigmoid
    A=sigmoid(Z)
    for(i in 1:dim(A)[2]){
        # If A > 0.5 set value as 1
        if(A[1,i] > 0.5)
        yPredicted[1,i]=1
       else
        # Else set as 0
        yPredicted[1,i]=0
    }

    return(yPredicted)
}

# Normalize the matrix
normalize <- function(x){
    #Create the norm of the matrix.Perform the Frobenius norm of the matrix 
    n<-as.matrix(sqrt(rowSums(x^2)))
    #Sweep by rows by norm. Note '1' in the function which performing on every row
    normalized<-sweep(x, 1, n, FUN="/")
    return(normalized)
}

# Run the 2 layer Neural Network on the cancer data set
# Read the data (from sklearn)
cancer <- read.csv("cancer.csv")
# Rename the target variable
names(cancer) <- c(seq(1,30),"output")
# Split as training and test sets
train_idx <- trainTestSplit(cancer,trainPercent=75,seed=5)
train <- cancer[train_idx, ]
test <- cancer[-train_idx, ]

# Set the features
X_train <-train[,1:30]
y_train <- train[,31]
X_test <- test[,1:30]
y_test <- test[,31]
# Create a matrix of 0's with the number of features
w <-matrix(rep(0,dim(X_train)[2]))
b <-0
X_train1 <- normalize(X_train)
X_train2=t(X_train1)

# Reshape  then transpose
y_train1=as.matrix(y_train)
y_train2=t(y_train1)

# Perform gradient descent
gradDescent= gradientDescent(w, b, X_train2, y_train2, numIerations=3000, learningRate=0.77)


# Normalize X_test
X_test1=normalize(X_test)
#Transpose X_train so that we have a matrix as (features, numSamples)
X_test2=t(X_test1)

#Reshape y_test and take transpose
y_test1=as.matrix(y_test)
y_test2=t(y_test1)

# Use the values of the weights generated from Gradient Descent
yPredictionTest = predict(gradDescent$w, gradDescent$b, X_test2)
yPredictionTrain = predict(gradDescent$w, gradDescent$b, X_train2)

sprintf("Train accuracy: %f",(100 - mean(abs(yPredictionTrain - y_train2)) * 100))
## [1] "Train accuracy: 90.845070"
sprintf("test accuracy: %f",(100 - mean(abs(yPredictionTest - y_test)) * 100))
## [1] "test accuracy: 87.323944"
df <-data.frame(gradDescent$idx, gradDescent$losses)
names(df) <- c("iterations","losses")
ggplot(df,aes(x=iterations,y=losses)) + geom_point() + geom_line(col="blue") +
    ggtitle("Gradient Descent - Losses vs No of Iterations") +
    xlab("No of iterations") + ylab("Losses")

