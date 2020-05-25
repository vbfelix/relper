#' Harmonic mean
#'
#' @description Calculates harmonic mean
#'
#' @param x numeric vector
#'
#' @return Harmonic mean
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' harmonic_mean(x)
#'

harmonic_mean <- function(x){

  if(sum(x == 0, na.rm = T) > 0 ){
    warning("There is at least one value = 0 and that cause the harmonic mean to be 0")
  }

  1/mean(1/x, na.rm = T)

}
