#' Area under the curve (AUC)
#'
#' @description Calculates AUC
#'
#' @param x numeric vector.
#' @param y numeric vector.
#'
#' @return auc
#' @export
#'
#' @examples
#' x <- seq(-3,3,l = 100)
#'
#' y <- dnorm(x)
#'
#' plot(x,y)
#'
#' auc(x,y)


auc  <- function(x,y) {

    tryCatch({
    integrate(approxfun(x,y), range(x)[1], range(x)[2])$value
      },
    error = function(e) return(NA_real_)
    )

}
