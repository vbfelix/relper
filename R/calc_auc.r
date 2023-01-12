#' Area under the curve (AUC)
#'
#' @description Calculates AUC
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#' @param limits numeric range for integration (default = 'x' range)
#'
#' @return calc_auc
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
      integrate(approxfun(x,y), r[1], r[2])$value
    },
    error = function(e) return(NA_real_)
  )

}
