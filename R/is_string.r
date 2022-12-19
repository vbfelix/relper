#' String value
#'
#' @description return TRUE if the variable is a string
#'
#' @param x vector
#'
#' @return boolean
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
