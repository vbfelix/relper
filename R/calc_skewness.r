#' Skewness computation
#'
#' @description Computation of the skewness, a measure of the asymmetry.
#' This metric can be used to determine the shape of a variable,
#'  and whether it is symmetric or skewed.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A numeric single value with the computed value.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_skewness(x)
#'

calc_skewness <- function(x){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  x_mean <- mean(x,na.rm = TRUE)

  x_sd <- stats::sd(x,na.rm = TRUE)

  n <- length(x)

  output <- sum((x - x_mean)^3,na.rm = TRUE)/(n*x_sd^3)

  return(output)

}
