#' Conditional check for a value equal to zero
#'
#' @description Return TRUE if the value is equal to zero.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_zero(4)
#'
#' is_zero(0)
#'

is_zero <- function(x){

  stopifnot(is.numeric(x))

  output <- x == 0

  return(output)

}
