#' Opposite of is.na
#'
#' @description Check if the value is not a NA
#'
#' @param x single value or vector
#'
#' @return boolean
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
