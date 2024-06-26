#' Replace a boolean variable
#'
#' @description Replace a boolean
#'
#' @eval arg_vector("x","boolean")
#' @eval arg_value("true_value","",action = "will replace TRUE values")
#' @eval arg_value("false_value","",action = "will replace FALSE values")
#'
#' @return A numeric value
#'
#' @export
#'
#' @examples
#'
#' replace_boolean(c(T,T,T,F,F),1,2)
#'


replace_boolean <- function(x,true_value = NULL,false_value = NULL){

  stopifnot(length(true_value)==1,length(false_value)==1, class(true_value) == class(false_value))

  output <- dplyr::if_else(x,true_value,false_value)

  return(output)

}
