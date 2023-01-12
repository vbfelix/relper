#' Date variable
#'
#' @description return TRUE if the vector is a date
#'
#' @eval arg_vector("x","")
#'
#' @return Boolean vector
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

