#' Conditional check if a value is not contained in a vector
#'
#' @description Return TRUE if x is not contained in y, the opposite of \%in\%.
#'
#' @eval arg_vector("x","")
#' @eval arg_vector("y","")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' isnot_in("a", letters)
#'
#' isnot_in("1", letters)
#'

isnot_in <- function(x,y){

  !(x %in% y)

}
