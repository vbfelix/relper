#' Summary of two numeric variables
#'
#' @description Computation of the covariance, and Pearson, Kendall and Spearman correlations coefficients.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#'
#' @return A tibble (1x4) with the computed coefficients.
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

  stopifnot(is.numeric(x), length(x) > 2)

  stopifnot(is.numeric(y), length(y) > 2)

  stopifnot(length(x) == length(y))

  output <-
  dplyr::tibble(
    covariance = stats::var(x,y,na.rm = TRUE),
    pearson  =  stats::cor.test(x,y,method = "pearson",na.rm = TRUE)$estimate,
    kendall  =  stats::cor.test(x,y,method = "kendall",na.rm = TRUE)$estimate,
    spearman =  stats::cor.test(x,y,method = "spearman",na.rm = TRUE)$estimate
  )

  return(output)

}
