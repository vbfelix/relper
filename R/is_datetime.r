#' Datetime variable
#'
#' @description return TRUE if the vector is a datetime
#'
#' @eval arg_vector("x","")
#'
#' @return Boolean vector
#' @export
#'
#' @examples
#'
# is_datetime(Sys.time())
#
# is_datetime(Sys.Date())
#'

is_datetime <- function(x){

  sum(inherits(x, "POSIXct") + inherits(x, "POSIXt") + inherits(x, "POSIXlt")) > 0

}

