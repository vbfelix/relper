#' Negative number
#'
#' @description return TRUE if the number is negative
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' is_negative(4)
#'

is_negative <- function(x){

  stop_function(arg = x,type = "numeric")

  !relper::is_positive(x)

}
