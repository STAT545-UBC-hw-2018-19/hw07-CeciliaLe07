#' Does your linear model need the Boxcox transformation?
#'
#' This function analyzes the residuals of your model and suggest you to apply or not the Boxcox transformation
#'
#' @param model an object of type \code{lm} to be tested
#' @param conf level of confidence for test (shoulb be between 0 and 1)
#' @param plotit logical parameter. If is TRUE a graph of test is displayed
#'
#' @return \code{suggestion} gives you the suggestion about if transformation is needed or not.
#' @export
#' @examples
#' y <- runif(10,0,20)
#' x <- rnorm(10)
#' need_boxcox(lm(y~x))

need_boxcox <- function(model, conf = 0.95, plotit=TRUE){
    #Validation of conf parameter
    if(conf!=0.95){
        if(0>conf || 1<conf){
            stop("Confidence level should be between 0 and 1")
        }
    }

    #Displaying the plot if is required
    if(plotit){
        qqnorm(model$residuals)
        qqline(model$residuals)
    }

    #Performing a test
    test <- shapiro.test(model$residuals)$p.value

    if(test<conf){
        suggestion <- "Could be a good idea to use apply_boxcox"
    }else{
        suggestion <- "Your linear model doesn't need boxcox transformation"
    }

    return(suggestion)
}
