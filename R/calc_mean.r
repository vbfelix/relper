#' Mean
#'
#' @description Compute arithmetic, geometric and harmonic mean
#'
#' @param x numeric vector
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

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  out <-
    dplyr::tibble(
      arithmetic =  mean(x, na.rm = TRUE),
      geometric  =  relper::calc_geometric_mean(x),
      harmonic   =  relper::calc_harmonic_mean(x)
    )

  return(out)

}


