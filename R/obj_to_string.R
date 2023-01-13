#' Return an object name as a string
#'
#' @description Return an object name as a string.
#'
#' @param x A R object
#'
#' @return A character single value with the name of the R object.
#'
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' obj_to_string(x)
#'

obj_to_string <- function(x){

  deparse(substitute(x))

}
