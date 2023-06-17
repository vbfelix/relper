#' Coefficient of variation computation
#'
#' @description Computation of the coefficient of variation (CV).
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_boolean("as_perc","multiply the CV by 100")
#'
#' @return A numeric single value with the computed CV.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_cv(x)
#'

calc_cv <- function(x, as_perc = FALSE){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  stop_function(arg = as_perc,type = "logical",single_value = TRUE)

  mu_x <- mean(x, na.rm = TRUE)

  if(is.na(mu_x)){

    return(NA_real_)

  }else{

    if(mu_x == 0){
      warning("mean = 0 -> cv is NaN.")
    }

    output <- stats::sd(x, na.rm = TRUE)/mu_x

    if(as_perc == TRUE){
      output <- 100*output
    }

    output <- abs(round(output,2))

    return(output)
  }

}
