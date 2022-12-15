#' Positive number
#'
#' @description return TRUE if the number is positive
#'
#' @param x numeric vector
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

  ifelse(x > 0, TRUE, FALSE)

}
