#' Opposite of is.na
#'
#' @description Check if the value is not a NA
#'
#' @eval arg_vector("x","")
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
