#' Auto-correlation function (ACF)
#'
#' @description Computes data of ACF ou CCF
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#'
#' @return tibble
#' @export
#'
#' @examples
#'
#'
#' x <- rnorm(100)
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
