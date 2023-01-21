#' Conditional check for an integer value
#'
#' @description Return TRUE if the value is a integer,
#'  not considering their variable type but the value itself.
#'
#' @eval arg_vector("x","numeric")
#'#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_integer(1)
#'
#' is_integer(1.1)
#'

is_integer<- function(x){

  # stop_function(arg = x,type = "numeric")

  output <- x %% 1 == 0

  return(output)
}
