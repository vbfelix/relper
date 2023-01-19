#' Kurtosis computation
#'
#' @description Computation of the kurtosis, a measure of the "peakedness".
#'  This metric can be used to determine the shape of a dataset,
#'   and whether it is platykurtic (flatter than a normal distribution),
#'    mesokurtic (same kurtosis as a normal distribution),
#'     or leptokurtic (more peaked than a normal distribution).
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
#' calc_kurtosis(x)
#'

calc_kurtosis <- function(x){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  x_mean <- mean(x,na.rm = TRUE)

  x_sd <- stats::sd(x,na.rm = TRUE)

  n <- length(x)

  output <- sum((x - x_mean)^4,na.rm = TRUE)/(n*x_sd^4) - 3

  return(output)

}
