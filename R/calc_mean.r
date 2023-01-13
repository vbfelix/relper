#' Arithmetic, geometric and harmonic mean computation
#'
#' @description Compute the arithmetic, geometric and harmonic mean.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A tibble (1x3) with the computed arithmetic, geometric and harmonic mean.
#'
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' calc_mean(x)
#'

calc_mean<- function(x){

  stop_function(arg = x,type = "numeric")

  out <-
    dplyr::tibble(
      arithmetic =  mean(x, na.rm = TRUE),
      geometric  =  relper::calc_geometric_mean(x),
      harmonic   =  relper::calc_harmonic_mean(x)
    )

  return(out)

}


