##input files
	#trainset: the M*K (M rows/samples, K columns/features) matrix of training set data, the demo below shows using 6 features (column 976,884,500,117,294,277) to			  fit the response (observed fractions, column 2)
	#testset: the N*K (N rows/samples, K columns/features) matrix of test set data
##output files
	#model-fitting.Rout: default output of model details
	#variance: mean absolute error for the test set
	#observe: observed fractions for the test set
	#predicted: predicted fractions for the test set
	#variance-fit: mean absolute error for the training set
	#observe-fit: observed fractions for the training set
	#predicted-fit: fitted fractions for the training set

library(data.table)
library(glmnet)
data <- fread(file="trainset",head=FALSE,sep="auto")
x <- as.matrix(data[,c(976,884,500,117,294,277)])
y <- as.matrix(data[,2])

cvfit = cv.glmnet(x,y,family="gaussian",alpha=1)
coef <- coef(cvfit,s = cvfit$lambda.1se)
show(coef)
test <- fread(file="testset",head=FALSE,sep="auto")
testx <- as.matrix(test[,c(976,884,500,117,294,277)])
predicted <- predict(cvfit, newx = testx,  s = cvfit$lambda.1se)
var <- ((test$V2-predicted)**2)**0.5
write.table(mean(var), "variance", row.names = FALSE)
write.table(test$V2, "observe", row.names = FALSE)
write.table(predicted, "predicted", row.names = FALSE)

test <- fread(file="trainset",head=FALSE,sep="auto")
testx <- as.matrix(test[,c(976,884,500,117,294,277)])
predicted <- predict(cvfit, newx = testx,  s = cvfit$lambda.1se)
var <- ((test$V2-predicted)**2)**0.5
write.table(mean(var), "variance-fit", row.names = FALSE)
write.table(test$V2, "observe-fit", row.names = FALSE)
write.table(predicted, "predicted-fit", row.names = FALSE)

