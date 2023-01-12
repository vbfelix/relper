#' Compute the number of values that are repeated in sequence
#'
#' @description Compute the number of values that are repeated in sequence
#'
#' @eval arg_vector("x","")
#'
#' @return data.frame
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


