#' Scaling data
#'
#' @description Scale data, making them go from 0 to superior lim (1 by default)
#'
#' @param x numeric vector
#' @param lim_sup numeric value
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

scale01 <- function(x, lim_sup = 1){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  if(is.numeric(lim_sup) == F){
    stop("lim_sup must be numeric")
  }

  if(length(lim_sup) != 1){
    stop("lim_sup must be just one numeric value")
  }

  if(lim_sup <= 0){
    stop("lim_sup must be > 0")
  }

  max_x <- max(x, na.rm = T)

  min_x <- min(x, na.rm = T)

  out <- lim_sup*(x - min_x)/(max_x - min_x)

  return(out)
}


