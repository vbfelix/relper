#' Auto-correlation computation
#'
#' @description Computation of the auto-correlation function (ACF) or the
#'  cross-correlation function (CCF), if the argument 'y' is provided.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric",default = "NULL",action = "will be the value to compute the CCF")
#'
#' @return A tibble (lag x 2) with: \cr - ACF/CCF. \cr - lag.
#' @export
#'
#' @examples#'
#'
#' x <- rnorm(100)
#'
#' calc_acf(x)
#'
#' y <- rexp(100)
#'
#' calc_acf(x,y)
#'

calc_acf <- function(x,y = NULL,...){

  stop_function(arg = x,type = "numeric")

  stop_function(arg = y,type = "numeric",null = TRUE)

  stop_two_args(arg1 = x, arg2 = y, equal_length = TRUE,null = TRUE)

  if(is.null(y)){

    aux <- acf(x,plot = FALSE,...)

    output <- tibble::tibble(
      acf = unlist(aux[[1]][,1,1]),
      lag = unlist(aux[[4]][,1,1])
    )
  }else{

    aux <- ccf(x,y,plot = FALSE,...)

    output <- tibble::tibble(
      ccf = unlist(aux[[1]][,1,1]),
      lag = unlist(aux[[4]][,1,1])
    )
  }

  return(output)
}
