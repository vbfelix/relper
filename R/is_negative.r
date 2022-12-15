#' Negative number
#'
#' @description return TRUE if the number is negative
#'
#' @param x numeric vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' is_negative(4)
#'

is_negative <- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  !relper::is_positive(x)

}
