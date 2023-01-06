#' Coefficient of variation (CV)
#'
#' @description Coefficient of variation
#'
#' @param x numeric vector
#' @param as_perc as percentage (default = FALSE)
#'
#' @return Coefficient of variation
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_cv(x)
#'

calc_cv <- function(x, as_perc = FALSE){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(!is.logical(as_perc)){stop("'perc' must be logical.")}

  mu_x <- mean(x, na.rm = TRUE)

  if(is.na(mu_x)){
    return(NA_real_)
  }else{

    if(mu_x == 0){
      warning("mean = 0 -> cv is NaN.")
    }

    output <- sd(x, na.rm = TRUE)/mu_x

    if(as_perc == TRUE){
      output <- 100*output
    }

    output <- abs(round(output,2))

    return(output)
  }

}
