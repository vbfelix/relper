#' Difference between dates
#'
#' @description Difference between dates (date2 - date1)
#'
#' @param date1 date number 1
#' @param date2 date number 2
#' @param add auxiliar number to sum to the difference (date2 - date1 + add)
#' @param unit unit of the date difference
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

  if(!is.numeric(add)){stop("'add' must be numeric.")}

  unit <- tolower(unit)

  if(!(unit %in% c("secs", "mins", "hours","days", "weeks"))){
    stop("'unit' must be one of secs, mins, hours, days, weeks.")
  }

  out <- as.numeric(difftime(date2,date1,units = unit)) + add

  return(out)

}
