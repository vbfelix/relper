#' Coefficient of variation (CV)
#'
#' @description Coefficient of variation
#'
#' @param x numeric vector
#' @param perc as percentage (T = default)
#'
#' @return Coefficient of variation
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' cv(x)
#'

cv <- function(x, perc = T){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  if(is.logical(perc) == F){
    stop("perc must be logical")
  }

  if(perc == T){
    100*sd(x, na.rm = T)/mean(x, na.rm = T)
  } else{
    sd(x, na.rm = T)/mean(x, na.rm = T)
  }

  }
