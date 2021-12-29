#' Coefficient of variation (CV)
#'
#' @description Coefficient of variation
#'
#' @param x numeric vector
#' @param perc as percentage (default = T)
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

cv <- function(x, perc = TRUE){

  if(!is.numeric(x)){
    stop("x must be numeric.")
  }

  if(!is.logical(perc)){
    stop("perc must be logical.")
  }

  mu_x <- mean(x, na.rm = TRUE)

  if(is.na(mu_x)){
    return(NA_real_)
  }else{

    if(mu_x == 0){
      warning("mean = 0 -> cv is NaN.")
    }

    if(perc == T){
      out <- 100*sd(x, na.rm = TRUE)/mu_x
    } else{
      out <- sd(x, na.rm = TRUE)/mu_x
    }

    out <- abs(round(out,2))

    return(out)
  }

}
