#' Difference between dates
#'
#' @description Computes data of ACF ou CCF
#'
#' @param first_date
#' @param last_date
#'
#' @return tibble
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
