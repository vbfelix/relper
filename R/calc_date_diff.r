#' Difference between dates
#'
#' @description Difference between dates (date2 - date1 + add)
#'
#' @param date1 date number 1
#' @param date2 date number 2
#' @param add auxiliar value (default = 0)
#' @param unit unit of the date difference (secs, mins, hours, days, weeks)
#'
#' @return numeric value
#' @export
#'
#' @examples
#'
#' date1 <- lubridate::dmy("01/05/1998")
#'
#' date2 <- lubridate::dmy("21/11/2018")
#'
#' calc_date_diff(date1 = date1,date2 = date2,units = "days")

calc_date_diff <- function(date1,date2,add = 0, unit = "days"){

  if(!lubridate::is.Date(date1)){stop("'date1' must be a date.")}

  if(!lubridate::is.Date(date2)){stop("'date2' must be a date.")}

  if(!is.numeric(add)){stop("'add' must be numeric.")}

  if(!is.character(unit)){stop("'unit' must be character.")}

  unit <- tolower(unit)

  units <- c("secs", "mins", "hours","days", "weeks")

  if(!(unit %in% units)){stop("'unit' must be one of secs, mins, hours, days, weeks.")}

  out <- as.numeric(difftime(date2,date1,units = unit)) + add

  return(out)

}
