#' Scaling
#'
#' @description Transform numeric to percentage
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_boolean("sum","add the values")
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' x <- c(.4,.6)
#'
#' as_perc(x)
#'

as_perc <- function(x, sum = FALSE){

  stop_function(arg = x,type = "numeric")

  stop_function(arg = sum,type = "logical",single_value = TRUE)

  if(sum == FALSE){
    output <- 100*x
  }else{
    output <- 100*x/sum(x)
  }

  return(output)

}
