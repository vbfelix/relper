#' Conditional check for a positive value
#'
#' @description Return TRUE if the value is positive.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A boolean vector with the return from the condition check.
#' @export
#'
#' @examples
#'
#' is_positive(4)
#'
#' is_positive(-4)
#'

is_positive <- function(x){

  stop_function(arg = x,type = "numeric")

  dplyr::if_else(
    condition = x > 0,
    true =  TRUE,
    false =  FALSE
    )

}
