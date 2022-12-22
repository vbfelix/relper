#' Compute the number of values that are repeated in sequence
#'
#' @description Compute the number of values that are repeated in sequence
#'
#' @param x vector
#'
#' @return data.frame
#' @export
#'
#' @examples
#'
#' x <- c(1, 1, 1, 2, 2, 2, 2, 3, 4, 5, 6, 7, 1, 1)
#'
#' calc_rep_seq(x)
#'

calc_rep_seq <- function(x){

  aux <- rle(x)

  output <- data.frame(value = aux$values,num_rep = aux$lengths)

  return(output)
}


