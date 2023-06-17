#' Conditional check for an even value
#'
#' @description Return TRUE if the value is even.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_even(4)
#'
#' is_even(3)
#'

is_even <- function(x){

  stop_function(arg = x,type = "numeric")

  x_as_char <- as.character(x)

  n_char <- nchar(x_as_char)

  last_char <- substr(x_as_char,start = n_char, stop = n_char)

  output <- as.numeric(last_char) %% 2 == 0

  output[which(x == 0)] <- NA

  warn_any_na(output)

  return(output)

}
