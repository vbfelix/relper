#' Scaling data
#'
#' @description Scale data, making them go from 0 to 1
#'
#' @param x numeric vector
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

scale01 <- function(x){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  maxx <- max(x, na.rm = T)

  minx <- min(x, na.rm = T)

  out <- (x - minx)/(maxx - minx)

  return(out)
}


