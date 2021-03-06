#' Geometric mean
#'
#' @description Calculates geometric mean
#'
#' @param x numeric vector
#'
#' @return Geometric mean
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' geometric_mean(x)
#'

geometric_mean <- function(x){

  if(sum(x == 0, na.rm = T) > 0 ){
    warning("There is at least one value = 0 and that cause the geometric mean to be 0")
  }

  if(sum(x < 0, na.rm = T) > 0 ){
    warning("There is at least one value < 0 and that cause NaN's when computing the geometric mean")
  }

  exp(mean(log(x), na.rm = T))

}
