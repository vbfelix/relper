#' Difference between two dates
#'
#' @description Computation of the difference between two dates (date2 - date1 + add).
#'
#' @eval arg_value("date1","date")
#' @eval arg_value("date2","date")
#' @eval arg_value("add","numeric",default = "0")
#' @eval arg_date_unit("unit")
#'
#' @return A numeric single value with the computed difference between the two dates.
#'
#' @export
#'
#' @examples
#'
#' date1 <- lubridate::dmy("01/05/1998")
#'
#' date2 <- lubridate::dmy("21/11/2018")
#'
#' dttm_diff(date1 = date1,date2 = date2,unit = "days")

dttm_diff <-
  function(
    date1,
    date2,
    add = 0,
    unit = c("secs", "mins", "hours","days", "weeks")
    ){

  stop_function(arg = date1,type = "date")

  stop_function(arg = date2,type = "date")

  stop_function(arg = add,type = "numeric",single_value = TRUE)

  stop_function(arg = unit,type = "character",single_value = TRUE)

  unit_ref <- c("secs", "mins", "hours","days", "weeks")

  stop_one_of(unit,unit_ref)

  output <- as.numeric(difftime(date2,date1,units = unit)) + add

  return(output)

}
