#' Date range
#'
#' @description Gets range of a date vector
#'
#' @eval arg_vector("x","date")
#'
#' @return character vector
#' @export
#'
#' @examples
#' x <- seq(as.Date("1910/1/1"), as.Date("1911/1/1"), "days")
#'
#' calc_date_range(x)
#'

calc_date_range <- function(x){

  if(sum(class(x) %in% c("POSIXct","POSIXt" )) > 0 ){
    x <- lubridate::as_date(x)
  }

  if(!lubridate::is.Date(x)){stop("'x' must be of a date.")}

  aux <- stringr::str_split(range(x,na.rm = TRUE), pattern = "-")

  output <-
    paste0(
      paste(aux[[1]][3:1],collapse ="/"),
      " - ",
      paste(aux[[2]][3:1],collapse ="/")
      )

  return(output)
}
