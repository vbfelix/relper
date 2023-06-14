#' Harmonic mean computation
#'
#' @description Computation of the harmonic mean.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A numeric single value with the computed harmonic mean.
#'
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' calc_harmonic_mean(x)
#'

calc_harmonic_mean <- function(x){

  stop_function(arg = x,type = "numeric")

  warn_any_zero(
    x  = x ,
    warning = "at least one value = 0 and that caused the mean to be 0."
  )

  output <- suppressWarnings(1/mean(1/x, na.rm = TRUE))

  return(output)
}
