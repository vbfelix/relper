#' Positive number
#'
#' @description return TRUE if the number is positive
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' is_positive(4)
#'

is_positive <- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  dplyr::if_else(x > 0, TRUE, FALSE)

}
