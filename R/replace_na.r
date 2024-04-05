#' Replace a NA value
#'
#' @description Replace a NA value
#'
#' @eval arg_vector("x","")
#' @eval arg_value("na_value","a value to replace NA values in x")
#'
#' @return A numeric value
#'
#' @export
#'
#' @examples
#'
#' replace_na(c(2,2,NA,NA,NA),1)
#'


replace_na <- function(x,na_value){

  stopifnot(length(na_value)==1)

  output <- dplyr::if_else(is.na(x),na_value,x)

  return(output)

}
