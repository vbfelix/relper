#' Count the number of NA observations
#'
#' @description Count the number of NA observations
#'
#' @eval arg_value("x","")

#' @return A numeric value
#'
#' @export
#'
#' @examples
#'
#' count_na(c(2,2,2))
#'
#' count_na(c(2,2,NA))
#'


count_na <- function(x){

  output <- sum(is.na(x),na.rm = TRUE)

  return(output)

}
