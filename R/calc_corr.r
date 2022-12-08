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
#' calc_corr(x,y)
#'
#'

calc_corr <- function(x,y){

  if(!is.numeric(x)){stop("y must be numeric.")}

  if(!is.numeric(y)){stop("y must be numeric.")}

  if(length(x) < 3){stop("the lenght of 'x' must be > 2.")}

  if(length(y) < 3){stop("the lenght of 'y' must be > 2.")}

  if(length(x) != length(y)){stop("'x' and 'y' must have the same length.")}

  out <-
  dplyr::tibble(
    pearson  =  cor.test(x,y,method = "pearson",na.rm = TRUE)$estimate,
    kendall  =  cor.test(x,y,method = "kendall",na.rm = TRUE)$estimate,
    spearman =  cor.test(x,y,method = "spearman",na.rm = TRUE)$estimate
  )

  return(out)

}
