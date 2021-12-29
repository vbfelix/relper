#' Numeric correlation
#'
#' @description Compute pearson, kendall and spearman correlation coefficient
#'
#' @param x numeric vector
#' @param y numeric vector
#'
#'
#' @return Numeric vector
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
#' num_corr(x,y)
#'
#'

num_corr <- function(x,y){

  if(!is.numeric(x)){
    stop("x must be numeric.")
  }

  if(!is.numeric(y)){
    stop("y must be numeric.")
  }

  out <-
  dplyr::tibble(
    pearson  =  cor.test(x,y,method = "pearson",na.rm = TRUE)$estimate,
    kendall  =  cor.test(x,y,method = "kendall",na.rm = TRUE)$estimate,
    spearman =  cor.test(x,y,method = "spearman",na.rm = TRUE)$estimate
  )

  return(out)

}
