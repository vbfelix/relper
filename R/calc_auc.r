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
        r <- range(x)
      }else{
        r <- limits
      }
      stats::integrate(stats::approxfun(x,y), r[1], r[2])$value
    },
    error = function(e) return(NA_real_)
  )

}
