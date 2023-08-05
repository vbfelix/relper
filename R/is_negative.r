#' Conditional check for a negative value
#'
#' @description Return TRUE if the value is negative.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_negative(4)
#'
#' is_negative(-4)
#'

is_negative <- function(x){

  stopifnot(is.numeric(x))

  output <- !relper::is_positive(x)

  output[which(x == 0)] <- FALSE

  return(output)
}
