#' Mode for numeric values
#'
#' @description Find the high density value
#'
#' @eval arg_vector("x","numeric")
#'
#' @return numeric value
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' calc_peak_density(x)
#'

calc_peak_density <- function(x){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  d <- density(na.omit(x))

  output <- d$x[which.max(d$y)]

  return(output)

}
