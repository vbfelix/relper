#' Scaling data
#'
#' @description Rescale data
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("new_min","numeric",default = "0",action = "will be the new minimum value")
#' @eval arg_value("new_max","numeric",default = "1",action = "will be the new maximum value")
#'
#' @return numeric vector
#'
#' @export
#'
#' @examples
#'
#' x <- seq(-3,3,l = 100)
#'
#' range(x)
#'
#' y <- format_scale(x)
#'
#' range(y)
#'
#' plot(x,y)
#'

format_scale <- function(x, new_min = 0, new_max = 1){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  stop_function(arg = new_min,type = "numeric",single_value = TRUE)

  stop_function(arg = new_max,type = "numeric",single_value = TRUE)

  stop_two_args(arg1 = new_min,arg2 = new_max,bigger_than = TRUE)

  max_x <- max(x, na.rm = TRUE)

  min_x <- min(x, na.rm = TRUE)

  output <- (new_max-new_min) * ((x - min_x)/(max_x - min_x)) + new_min

  return(output)
}


