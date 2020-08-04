#' Convert case of a string
#'
#' @description str_to_upper to strings with number of characters lower than "n_char" (default = 3)
#'
#' @param x characther vector
#' @param n_char numeric value
#'
#' @return numeric value
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' num_mode(x)
#'

str_to_text <- function(x, n_char = 3){

  if(is.character(x) == F & is.factor(x) == F){
    stop("x must be characther/factor")
  }

  if(is.numeric(n_char) == F){
    stop("n_char must be numeric")
  }

  if(length(n_char) > 1){
    stop("n_char must be a single value")
  }

  ifelse(nchar(x) <= n_char, stringr::str_to_upper(x),stringr::str_to_sentence(x))

}
