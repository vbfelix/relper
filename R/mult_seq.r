#' Sequence by a multiple
#'
#' @description Gets sequence by a multiple, with the minimum and maximum of data
#'
#' @param x numeric vector.
#' @param m multiple.
#'
#' @return sequence
#' @export
#'
#' @examples
#' x <- rnorm(100)
#'
#' mult_seq(x,m = .5)
#'

mult_seq <- function(x, m=1){

  min <- m*ceiling((min(x)-m)/m)

  max <- m*ceiling((max(x)+m)/m)

  out <- seq(min, max, by = m)

  return(out)

}

