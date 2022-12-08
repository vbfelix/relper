#' Convert case of a string
#'
#' @description str_to_upper to strings with number of characters lower than "n_char" (default = 3)
#'
#' @param string characther vector
#' @param n_char numeric value
#'
#' @return numeric value
#' @export
#'
#' @examples
#'
#' string <- c("aaaaa","bb","ccc","dddd")
#'
#' str_to_text(string)
#'

str_to_text <- function(string, n_char = 3){

  if(!is.character(string) & !is.factor(string)){
    stop("'string must' be a characther/factor.")
  }

  if(!is.numeric(n_char)){stop("'n_char' must be numeric.")}

  if(length(n_char) > 1){ stop("'n_char' must be a single value.")}

  ifelse(
    nchar(string) <= n_char,
    stringr::str_to_upper(string),
    stringr::str_to_sentence(string)
    )

}
