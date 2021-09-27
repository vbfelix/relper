#' Object to string
#'
#' @description Get the name of the object and return as a string
#'
#' @param x
#'
#' @return vector
#' @export
#'
#' @examples
#'
#'
#' x <- rnorm(100)
#'
#' obj_to_string(x)
#'
#'

obj_to_string <-
  function(x){
    deparse(substitute(x))
  }
