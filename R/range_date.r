#' Date range
#'
#' @description Gets range of a date vector
#'
#' @param x date vector.
#'
#' @return date range
#' @export
#'
#' @examples
#' x <- seq(as.Date("1910/1/1"), as.Date("1911/1/1"), "days")
#'
#' range_date(x)
#'

range_date <- function(x){

  if(sum(class(x) %in% c("POSIXct","POSIXt" )) > 0 ){
    x <- lubridate::as_date(x)
  }

  if(class(x) != "Date"){
    stop("x must be of class Date.")
  }

  aux <- stringr::str_split(range(x,na.rm = TRUE), pattern = "-")

  out <-
    paste0(
      paste(aux[[1]][3:1],collapse ="/"),
      " - ",
      paste(aux[[2]][3:1],collapse ="/")
      )

  return(out)
}
