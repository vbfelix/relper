#' Odd number
#'
#' @description return TRUE if the number is odd
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Boolean vector
#' @export
#'
#' @examples
#'
#' is_odd(4)
#'

is_odd <- function(x){

  stop_function(arg = x,type = "numeric")

  output <- !relper::is_even(x)

  return(output)

}
