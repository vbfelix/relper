#' Harmonic mean
#'
#' @description Calculates harmonic mean
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Harmonic mean
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' calc_harmonic_mean(x)
#'

calc_harmonic_mean <- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(sum(x == 0, na.rm = TRUE) > 0 ){
    warning("There is at least one value = 0 and that cause the harmonic mean to be 0.")
  }

  1/mean(1/x, na.rm = TRUE)

}
