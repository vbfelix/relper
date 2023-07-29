#' Summary of two numeric variables
#'
#' @description Computation of the covariance, and Pearson, Kendall and Spearman correlations coefficients.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#'
#' @return A tibble (1x3) with the computed coefficients.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' y <- rnorm(100)
#'
#' plot(x,y)
#'
#' summary_xy(x,y)
#'

summary_xy <- function(x,y){

  stop_function(arg = x,type = "numeric",length_bigger = 2)

  stop_function(arg = y,type = "numeric",length_bigger = 2)

  stop_two_args(arg1 = x, arg2 = y, equal_length = TRUE)

  output <-
  dplyr::tibble(
    covariance = stats::var(x,y,na.rm = TRUE),
    pearson  =  stats::cor.test(x,y,method = "pearson",na.rm = TRUE)$estimate,
    kendall  =  stats::cor.test(x,y,method = "kendall",na.rm = TRUE)$estimate,
    spearman =  stats::cor.test(x,y,method = "spearman",na.rm = TRUE)$estimate
  )

  return(output)

}