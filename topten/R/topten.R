
#' Building a model with top 10 predictors
#' 
#' This function develops a linear predition model using top 10 featers in 'x' that are most predictive of 'y'
#' 
#' @param x a n x p matrix of the n observations a p predictors
#' @param y a vector of length n representing the response
#' @return a vector of coefficients from the final fitted model using the top 10 predictors
#' @author costab06
#' @details This function runs a univariate regression of y on each of the predictors in x and calculates a p-value 
#' indicating the significance of the association.  The final set of 10 predictors is taken from the 10 smallest p-values
#' @seealso \code{lm}
#' @export
#' @importFrom stats lm




topten<-function(x,y) {
        p<-ncol(x)
        if(p<10)
                stop("Must have at least 10 predictors!")
        #create a linear model for each predictor and select the top ten smallest p-value predocts
        # then create a multivariate model with those 10
        pvalues<-numeric(p)
        for(i in seq_len(p)) {
                fit<- lm(y ~x[, i])
                summ<-summary(fit)
                pvalues[i]<-summ$coefficients[2,4]
        }
        ord<-order(pvalues)
        ord<-ord[1:10]
        x10<-x[,ord]
        fit <-lm(y ~ x10)
        coef(fit)
        
}



#' Prediction with the Top Ten Features
#' 
#' 
#' This function takes a set of coefficients produced by the code \code{topten}
#' function and makes the prediction for each of the values provided in the input 'X' matrix
#' 
#' @param X a n x 10 matrix containing n new observations
#' @param b a vector of coefficients obtained from the \code{topten} function
#' @return a numeric vector containing the predicted values
#' @export

predict10<-function(X, b) {
        X<-cbind(1,X)
        drop(X %*% b)
        
}