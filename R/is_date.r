#' Conditional check for a date variable
#'
#' @description Return TRUE if the vector is a date.
#'
#' @eval arg_vector("x","")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
# is_date(Sys.time())
#
# is_date(Sys.Date())
#'

is_date <- function(x){

  inherits(x, "Date")

}

