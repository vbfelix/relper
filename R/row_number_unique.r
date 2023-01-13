#' Create a rank given unique values from a variable
#'
#' @description Get the row number for unique values.
#'
#' @eval arg_vector("x","")
#'
#' @return A numeric vector with rank, given the unique values from argument 'x'.
#'
#' @export
#'
#' @examples
#'
#' row_number_unique(mtcars$gear)
#'

row_number_unique <- function(x){
  purrr::map_int(seq_along(x), function(y) length(unique(x[1:y])))
}
