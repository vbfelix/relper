#' Conditional check for n negative value
#'
#' @description return TRUE if the value is negative
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Boolean vector
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
