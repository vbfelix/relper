#' Difference between dates
#'
#' @description Difference between dates (date2 - date1 + add)
#'
#' @eval arg_value("date1","date")
#' @eval arg_value("date2","date")
#' @eval arg_value("add","numeric",default = "0")
#' @eval arg_date_unit("unit")
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

  stop_function(arg = date1,type = "date")

  stop_function(arg = date2,type = "date")

  stop_function(arg = add,type = "numeric",single_value = TRUE)

  stop_function(arg = unit,type = "character",single_value = TRUE)

  unit_ref <- c("secs", "mins", "hours","days", "weeks")

  stop_one_of(unit,unit_ref)

  output <- as.numeric(difftime(date2,date1,units = unit)) + add

  return(output)

}
