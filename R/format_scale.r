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

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(length(x) == 1){stop("'x' length must be > 1.")}

  if(!is.numeric(new_max)){stop("'new_max' must be numeric.")}

  if(!is.numeric(new_min)){stop("'new_min' must be numeric.")}

  if(length(new_max) > 1){stop("'new_max' must be a single value.")}

  if(length(new_min) > 1){stop("'new_min' must be a single value.")}

  if(new_max <= new_min){stop("'new_max' must be > 'new_min'.")}

  max_x <- max(x, na.rm = TRUE)

  min_x <- min(x, na.rm = TRUE)

  output <- (new_max-new_min) * ((x - min_x)/(max_x - min_x)) + new_min

  return(output)
}


