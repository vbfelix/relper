#' Conditional check for a blank value
#'
#' @description Return TRUE if the value is blank.
#'
#' @eval arg_vector("x","character")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_blank("")
#'
#' is_blank(NA_character_)
#'
#' is_blank(" ")
#'
#' is_blank("-")
#'

is_blank <- function(x){

  stopifnot(is.character(x))

  x <- stringr::str_trim(x)

  output <- (is.na(x)) | (x == "") | (x == "-")

  return(output)

}
