#' Transform value to percentage
#'
#' @description Transform numeric values to percentage, by:
#' \cr
#' \cr  - Multiplying the values by 100, if sum = FALSE (default).
#' \cr  - Adding the values and computing the percentage, if sum = TRUE.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_boolean("sum","add the values and compute the percentage")
#'
#' @return A numeric vector with x as percentage.
#'
#' @export
#'
#' @examples
#'
#' #sum = FALSE (default)
#' x <- c(.4,.6)
#' as_perc(x)
#'
#' #sum = TRUE
#' x <- c(120,180)
#' as_perc(x,sum = TRUE)

as_perc <- function(x, sum = FALSE){

  stopifnot(is.numeric(x))

  stopifnot(is.logical(sum), length(sum) == 1)

  if(!sum){
    output <- 100*x
  }else{
    output <- 100*x/sum(x)
  }

  return(output)

}
