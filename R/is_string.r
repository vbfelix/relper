#' Conditional check for an string value
#'
#' @description Return TRUE if the value is a string (character or factor).
#'
#' @eval arg_vector("x","")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_string("A")
#'

is_string <- function(x){

  dplyr::if_else(
    condition = is.character(x) | is.factor(x),
    true = TRUE,
    false = FALSE
  )
}
