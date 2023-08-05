#' Rescale data
#'
#' @description Rescale data to have a new range.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("new_min","numeric",default = "0",action = "will be the new minimum value")
#' @eval arg_value("new_max","numeric",default = "1",action = "will be the new maximum value")
#'
#' @return A numeric vector.
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

  stopifnot(is.numeric(x), length(x) > 1)

  stopifnot(is.numeric(new_min), length(new_min) == 1)

  stopifnot(is.numeric(new_max), length(new_max) == 1)

  stopifnot(new_max > new_min)

  max_x <- max(x, na.rm = TRUE)

  min_x <- min(x, na.rm = TRUE)

  output <- (new_max-new_min) * ((x - min_x)/(max_x - min_x)) + new_min

  return(output)
}


