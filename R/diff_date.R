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

diff_date <- function(first_date,last_date){

  out <- as.numeric(difftime(last_date,first_date,units = "days")) + 1

  return(out)

}
