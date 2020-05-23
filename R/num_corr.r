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
#' num_corr(x,y)
#'

num_corr <- function(x,y){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  if(is.numeric(y) == F){
    stop("y must be numeric")
  }

  out <-
  dplyr::tibble(
    pearson =  cor.test(x,y,method = "pearson",na.rm = T)$estimate,
    kendall =  cor.test(x,y,method = "kendall",na.rm = T)$estimate,
    spearman = cor.test(x,y,method = "spearman",na.rm = T)$estimate
  )

  return(out)

}
