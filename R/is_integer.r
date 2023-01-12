#' Check if a value is a integer, but not by their type
#'
#' @description return TRUE if the number is a integer, not considering their type but the number itself
#'
#' @param x numeric vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' is_integer(1)
#'
#' is_integer(1.1)
#'

is_integer<- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  output <- x %% 1 == 0

  return(output)
}
