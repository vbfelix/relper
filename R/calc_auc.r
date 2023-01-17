#' Area under the curve computation
#'
#' @description Computation of the area under the curve (AUC), by linear interpolation.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#' @param limits A numeric vector of length 2 (default = range of 'x')
#'
#' @return A numeric single value with the computed AUC.
#' @export
#'
#' @examples
#'
#' x <- seq(-3,3,l = 100)
#'
#' y <- dnorm(x)
#'
#' plot(x,y)
#'
#' calc_auc(x,y)
#'

calc_auc  <- function(x,y, limits = NULL) {

  stop_function(arg = x,type = "numeric")

  stop_function(arg = y,type = "numeric")

  stop_function(arg = limits,type = "numeric",null = TRUE)

  stop_two_args(arg1 = x, arg2 = y, equal_length = TRUE)

  if((length(limits) != 0) & (length(limits) != 2)){
    stop("'limits' must be of length 2 or NULL.")
  }

  tryCatch(
    {
      if(is.null(limits)){
        auc_range <- range(x)
      }else{
        if(limits[1] < min(x,na.rm = TRUE)){
          warning("min('limits') < min(x), min(x) will be used instead")
          limits[1] <- min(x,na.rm = TRUE)
        }
        if(limits[2] > max(x)){
          warning("max('limits') > max(x), max(x) will be used instead")
          limits[2] <- max(x,na.rm = TRUE)
        }
        auc_range <- limits
      }
      stats::integrate(stats::approxfun(x,y), auc_range[1], auc_range[2])$value
    },
    error = function(e) return(NA_real_)
  )

}
