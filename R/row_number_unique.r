#' row_number() but consdering unique values
#'
#' @description Get the row number for unique values
#'
#' @param x vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' row_number_unique(mtcars$gear)
#'

row_number_unique <- function(x){
  purrr::map_int(seq_along(x), function(y) length(unique(x[1:y])))
}
