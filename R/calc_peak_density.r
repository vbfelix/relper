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
#' calc_peak_density(x)
#'

calc_peak_density <- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(length(x) == 1){stop("'x' length must be > 1.")}

  d <- density(na.omit(x))

  output <- d$x[which.max(d$y)]

  return(output)

}
