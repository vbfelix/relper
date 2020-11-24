#' Difference between dates
#'
#' @description  Difference between dates
#'
#' @param first_date
#' @param last_date
#'
#' @return numeric value
#' @export
#'
#' @examples
#'
#'
#'

diff_date <- function(first_date,last_date, units = "days",aux_sum = 0){

  out <- as.numeric(difftime(last_date,first_date,units = units)) + aux_sum

  return(out)

}
