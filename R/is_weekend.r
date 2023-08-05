#' Conditional check if a date is a weekend
#'
#' @description Return TRUE if the date vector is a weekend (saturday/sunday).
#'
#' @eval arg_vector("x","date")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_weekend(x = Sys.time())
#'
#' is_weekend(x = Sys.Date())
#'

is_weekend <- function(x){

  stopifnot(relper::is_date(x) | relper::is_datetime(x))

  if(relper::is_datetime(x)){x <- lubridate::as_date(x)}

  output <- lubridate::wday(x,label = FALSE) %in% c(1,7)

  return(output)

}
