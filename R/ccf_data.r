#' Cross-correlation function (CCF)
#'
#' @description Computes data of CCF
#'
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
#' ccf_data(x,y)
#'


ccf_data <- function(x,y,...){
  aux_ccf <- ccf(x,y,plot = F,...)

  out <- tibble::tibble(
    acf = unlist(aux_ccf[[1]][,1,1]),
    lag = unlist(aux_ccf[[4]][,1,1]))

  return(out)
}
