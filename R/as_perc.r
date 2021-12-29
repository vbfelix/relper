#' Scaling
#'
#' @description Transform numeric to percentage
#'
#' @param x numeric vector
#' @param sum need to sum the value (T/F)
#'
#' @return numeric vector
#' @export
#'
#' @examples
#'
#' x <- c(.4,.6)
#'
#' as_perc(x)
#'

as_perc <- function(x, sum = FALSE){

  if(!is.numeric(x)){
    stop("x must be numeric.")
  }

  if(sum == FALSE){
    out <- 100*x
  }else{
    out <- 100*x/sum(x)
  }

  return(out)

}
