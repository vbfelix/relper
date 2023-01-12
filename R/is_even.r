#' Even number
#'
#' @description return TRUE if the number is even
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' is_even(4)
#'

is_even <- function(x){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  x_as_char <- unlist(strsplit(as.character(x),split = ""))

  x_len <- length(x_as_char)

  n <- dplyr::if_else(x_as_char[x_len] == "0",x_len - 1L,x_len)

  condition <- (as.numeric(x_as_char[n])) %% 2 == 0

  output <- dplyr::if_else(condition, TRUE, FALSE)

  return(output)

}
