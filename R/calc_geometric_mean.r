#' Geometric mean computation
#'
#' @description Computation of the geometric mean.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A numeric single value with the computed geometric mean.
#'
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' calc_geometric_mean(x)
#'

calc_geometric_mean <- function(x){

  stop_function(arg = x,type = "numeric")

  warn_any_zero(
    x  = x,
    warning = "At least one value = 0 and that caused the mean to be 0."
  )

  #log already provides warning for values < 0
  output <- suppressWarnings(exp(mean(log(x), na.rm = TRUE)))

  return(output)
}

