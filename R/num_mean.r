#' Mean
#'
#' @description Compute arithmetic, geometric and harmonic mean
#'
#' @param x numeric vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' num_mean(x)
#'

num_mean<- function(x){

  if(!is.numeric(x)){
    stop("x must be numeric.")
  }

  out <-
    dplyr::tibble(
      arithmetic =  mean(x, na.rm = TRUE),
      geometric  =  relper::geometric_mean(x),
      harmonic   =  relper::harmonic_mean(x)
    )

  return(out)

}


