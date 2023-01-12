#' Opposite of in
#'
#' @description Check if  x is not contained in y
#'
#' @eval arg_value("x","")
#' @eval arg_vector("y","")
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
