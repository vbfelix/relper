#' Area under the curve (AUC)
#'
#' @description Calculates AUC
#'
#' @param x numeric vector
#' @param y numeric vector
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

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(!is.numeric(y)){stop("'y' must be numeric.")}

  if((is.numeric(limits) == FALSE) & (is.null(limits) == FALSE)){
    stop("'limits' must be numeric or NULL.")
  }

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
