#' Odd number
#'
#' @description return TRUE if the number is odd
#'
#' @param x numeric vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' is_odd(4)
#'

is_odd <- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  output <- !relper::is_even(x)

  return(output)

}
