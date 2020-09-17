#' Auto-correlation function (ACF)
#'
#' @description Computes data of ACF ou CCF
#'
#' @param x
#' @param y
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
#' acf_data(x,y)
#'

acf_data <- function(x,y = NULL,...){

  if(is.null(y)){

    aux <- acf(x,plot = F,...)

    out <- tibble::tibble(
      acf = unlist(aux[[1]][,1,1]),
      lag = unlist(aux[[4]][,1,1])
    )

  }else{

    aux <- ccf(x,y,plot = F,...)

    out <- tibble::tibble(
      acf = unlist(aux[[1]][,1,1]),
      lag = unlist(aux[[4]][,1,1])
    )

  }


  return(out)
}
