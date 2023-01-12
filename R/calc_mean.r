#' Mean
#'
#' @description Compute arithmetic, geometric and harmonic mean
#'
#' @eval arg_vector("x","numeric")
#'
#' @return data.frame
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


