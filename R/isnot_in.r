#' Opposite of %in%
#'
#' @description Check if  x is not contained in y
#'
#' @param x single value
#' @param y vector
#'
#' @return boolean
#' @export
#'
#' @examples
#'
#' isnot_in("a", letters)
#'

isnot_in <- function(x,y){

  !(x %in% y)

}
