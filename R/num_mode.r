#' Mode for numeric values
#'
#' @description Find the high density value
#'
#' @param x numeric vector
#'
#' @return numeric value
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' num_mode(x)
#'

num_mode <- function(x){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  d <- density(x)

  modes <- function(d){
    i <- which(diff(sign(diff(d$y))) < 0) + 1
    data.frame(x = d$x[i], y = d$y[i])
  }

  return(d$x[which.max(d$y)])

}
