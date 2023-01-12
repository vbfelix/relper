#' Scaling
#'
#' @description Transform numeric to percentage
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_boolean("sum","add the values")
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

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(!is.logical(sum)){stop("'sum' must be logical.")}

  if(sum == FALSE){
    output <- 100*x
  }else{
    output <- 100*x/sum(x)
  }

  return(output)

}
