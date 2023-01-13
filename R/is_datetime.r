#' Conditional check for a datetime variable
#'
#' @description Return TRUE if the vector is a datetime.
#'
#' @eval arg_vector("x","")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_datetime(Sys.time())
#'
#' is_datetime(Sys.Date())
#'

is_datetime <- function(x){

  sum(inherits(x, "POSIXct") + inherits(x, "POSIXt") + inherits(x, "POSIXlt")) > 0

}

