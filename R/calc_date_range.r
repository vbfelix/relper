#' Date range computation
#'
#' @description The computation of the range of a date vector.
#'
#' @eval arg_vector("x","date")
#'
#' @return A character single value in the format "{min(x)} - {max(x)}".
#' @export
#'
#' @examples
#' x <- seq(as.Date("1910/1/1"), as.Date("1911/1/1"), "days")
#'
#' calc_date_range(x)
#'

calc_date_range <- function(x){

  if(relper::is_datetime(x)){
    x <- lubridate::as_date(x)
  }

  stop_function(arg = x,type = "date")

  aux <- stringr::str_split(range(x,na.rm = TRUE), pattern = "-")

  output <-
    paste0(
      paste(aux[[1]][3:1],collapse ="/"),
      " - ",
      paste(aux[[2]][3:1],collapse ="/")
      )

  return(output)
}
