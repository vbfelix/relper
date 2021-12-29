#' Sequence by a multiple
#'
#' @description Gets sequence by a multiple, with the minimum and maximum of data
#'
#' @param x numeric vector
#' @param m multiple
#'
#' @return sequence
#' @export
#'
#' @examples
#' x <- rnorm(100)
#'
#' mult_seq(x,m = .5)
#'

mult_seq <- function(x, m = 1){

  if(!is.numeric(x)){
    stop("x must be numeric.")
  }

  if(!is.numeric(m)){
    stop("m must be numeric.")
  }

  if(m <= 0){
    stop("m must be > 0.")
  }

  min <- m*ceiling((min(x)-m)/m)

  max <- m*ceiling((max(x))/m)

  out <- seq(min, max, by = m)

  return(out)

}

