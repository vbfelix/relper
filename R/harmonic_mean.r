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
#' harmonic_mean(x)
#'

harmonic_mean <- function(x){

  1/mean(1/x)

  }
