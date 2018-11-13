#' Apply the boxcox transformation to a linear model
#'
#' This function returns the transformed response variable when apply the boxcox transformation to an specific linear model
#'
#' @param model an object of type \code{lm} to be transformed
#' @param digits desired number of digits for calculated \code{lambda} in the transformation.
#' @param transformed logical paramter. If is TRUE the function returns the vector of transformed response.
#' @param plotit logical parameter. If is TRUE a graph of log-likelihood is displayed
#'
#' @return The value of \code{lambda}, for apply the transformation.
#' @return The vector of \code{transformed response}.
#' @export
#' @import car
#' @examples
#' y <- runif(10,0,20)
#' x <- rnorm(10)
#' apply_boxcox(lm(y~x))
#' apply_boxcox(lm(y~x), digits = 2)
#' @details For more information about boxcox transformation and when it is convenient to use \href{https://en.wikipedia.org/wiki/Power_transform}{see this link}

apply_boxcox <- function(model,digits=1,transformed=TRUE, plotit=FALSE){
    boxcox_transformation <- car::boxCox(model,plotit = plotit)
    lambda <- round(boxcox_transformation$x[which.max(boxcox_transformation$y)],digits)

    if(transformed){
        transformed_response <- model$residuals+model$fitted.values^lambda
        list(lambda=lambda,transformed_response=transformed_response)
    }else{
        list(lambda=lambda)
    }
}
