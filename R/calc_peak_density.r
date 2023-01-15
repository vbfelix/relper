#' Peak density value computation
#'
#' @description Computation of the peak value, of a density function with a gaussian kernel.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A numeric single value with the computed peak density value.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' plot(density(x))
#'
#' calc_peak_density(x)
#'

calc_peak_density <- function(x){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  d <- stats::density(stats::na.omit(x))

  output <- d$x[which.max(d$y)]

  return(output)

}
