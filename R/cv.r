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

  mu_x <- mean(x, na.rm = T)

  if(mu_x == 0){
    stop("mean = 0 -> cv is NaN")
  }

  if(perc == T){
    100*sd(x, na.rm = T)/mu_x
  } else{
    sd(x, na.rm = T)/mu_x
  }

}
