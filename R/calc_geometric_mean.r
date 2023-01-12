#' Geometric mean
#'
#' @description Calculates geometric mean
#'
#' @eval arg_vector("x","numeric")
#'
#' @return Geometric mean
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' calc_geometric_mean(x)
#'

calc_geometric_mean <- function(x){

  stop_function(arg = x,type = "numeric")

  if(sum(x == 0, na.rm = TRUE) > 0 ){
    warning("There is at least one value = 0 and that caused the geometric mean to be 0.")
  }

  if(sum(x < 0, na.rm = TRUE) > 0 ){
    warning("There is at least one value < 0 and that cause NaN's when computing the geometric mean.")
  }

  exp(mean(log(x), na.rm = TRUE))

}
