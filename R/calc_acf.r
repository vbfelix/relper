#' Auto-correlation function (ACF)
#'
#' @description Computes data of ACF ou CCF
#'
#' @param x numeric vector
#' @param y numeric vector
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

  if(!is.numeric(x)){stop("x must be numeric.")}

  if(!is.numeric(y) & !is.null(y)){stop("y must be numeric/NULL.")}

  if(!is.null(y) & (length(y) != length(x)) ){stop("x and y have the same length.")}


  if(is.null(y)){

    aux <- acf(x,plot = FALSE,...)

    out <- tibble::tibble(
      acf = unlist(aux[[1]][,1,1]),
      lag = unlist(aux[[4]][,1,1])
    )
  }else{

    aux <- ccf(x,y,plot = FALSE,...)

    out <- tibble::tibble(
      ccf = unlist(aux[[1]][,1,1]),
      lag = unlist(aux[[4]][,1,1])
    )
  }

  return(out)
}
