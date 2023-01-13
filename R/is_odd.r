#' Conditional check for an odd value
#'
#' @description Return TRUE if the value is odd.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A boolean vector with the return from the condition check.
#' @export
#'
#' @examples
#'
#' is_odd(4)
#'
#' is_odd(3)
#'

is_odd <- function(x){

  stop_function(arg = x,type = "numeric")

  output <- !relper::is_even(x)

  return(output)

}
