#' Conditional check if a value is not a NA
#'
#' @description Return TRUE if the value is not a NA.
#'
#' @eval arg_vector("x","")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' isnot_na(2)
#'
#' isnot_na(NA)
#'

isnot_na <- function(x){

  !is.na(x)

}
