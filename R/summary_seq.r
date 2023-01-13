#' Summary of sequence of values
#'
#' @description Summary of repeated values in a sequence.
#'
#' @eval arg_vector("x","")
#'
#' @return A tibble with the values and the respective number of this values repeated in sequence.
#'
#' @export
#'
#' @examples
#'
#' x <- c(1, 1, 1, 2, 2, 2, 2, 3, 4, 5, 6, 7, 1, 1)
#'
#' summary_seq(x)
#'

summary_seq <- function(x){

  aux <- rle(x)

  output <- tibble::tibble(value = aux$values,num_rep = aux$lengths)

  return(output)
}


