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
#' not_na(2)
#'
#' not_na(NA)
#'

not_na <- function(x){

  !is.na(x)

}
