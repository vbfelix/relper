#' Scaling data
#'
#' @description Rescale data
#'
#' @param x numeric vector
#' @param lim_inf numeric value of the inferior limit (0 by default)
#' @param lim_sup numeric value of the superior limit (1 by default)
#'
#' @return numeric vector
#'
#' @export
#'
#' @examples
#'
#' x <- seq(-3,3,l = 100)
#'
#' range(x)
#'
#' y <- scale01(x)
#'
#' range(y)
#'
#' plot(x,y)
#'

scale01 <- function(x, lim_inf = 0, lim_sup = 1){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  if(length(x) == 1){
    stop("length of x must be > 1")
  }

  if(is.numeric(lim_sup) == F){
    stop("lim_sup must be numeric")
  }

  if(is.numeric(lim_inf) == F){
    stop("lim_inf must be numeric")
  }

  if(length(lim_sup) != 1){
    stop("lim_sup must be just one numeric value")
  }

  if(length(lim_inf) != 1){
    stop("lim_inf must be just one numeric value")
  }

  if(lim_sup <= lim_inf){
    stop("lim_sup must be > lim_inf")
  }

  max_x <- max(x, na.rm = T)

  min_x <- min(x, na.rm = T)

  out <- (lim_sup-lim_inf) * ((x - min_x)/(max_x - min_x)) + lim_inf

  return(out)
}


