#' Conditional check for an integer value, but not by their variable type
#'
#' @description return TRUE if the number is a integer, not considering their type but the number itself
#'
#' @eval arg_vector("x","numeric")
#'#'
#' @return Boolean vector
#' @export
#'
#' @examples
#'
#' is_integer(1)
#'
#' is_integer(1.1)
#'

is_integer<- function(x){

  stop_function(arg = x,type = "numeric")

  output <- x %% 1 == 0

  return(output)
}
