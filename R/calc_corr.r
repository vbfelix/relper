#' Correlation computation
#'
#' @description Computation of the Pearson, Kendall and Spearman correlations coefficients.
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
#' calc_corr(x,y)
#'
#'

calc_corr <- function(x,y){

  stop_function(arg = x,type = "numeric",length_bigger = 2)

  stop_function(arg = y,type = "numeric",length_bigger = 2)

  stop_two_args(arg1 = x, arg2 = y, equal_length = TRUE)

  output <-
  dplyr::tibble(
    pearson  =  cor.test(x,y,method = "pearson",na.rm = TRUE)$estimate,
    kendall  =  cor.test(x,y,method = "kendall",na.rm = TRUE)$estimate,
    spearman =  cor.test(x,y,method = "spearman",na.rm = TRUE)$estimate
  )

  return(output)

}
