#' Opposite of in
#'
#' @description Check if a x are not in y
#'
#' @param x single value
#' @param y vector
#'
#' @return boolean
#' @export
#'
#' @examples
#'
#' not_in("a", letters)
#'

not_in <- function(x,y){

  !(x %in% y)

}
