#' Convert case of a string
#'
#' @description Apply str_to_upper to strings with number of characters lower than "n_char" (default = 3)
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
#' str_to_abb(string)
#'

str_to_abb <- function(string, n_char = 3){

  if(!is.character(string) & !is.factor(string)){
    stop("'string' must be a character.")
  }

  if(!is.numeric(n_char)){stop("'n_char' must be numeric.")}

  if(length(n_char) > 1){ stop("'n_char' must be a single value.")}

  if(n_char <= 0){stop("'n_char' must be > 0.")}

  dplyr::if_else(
    nchar(string) <= n_char,
    stringr::str_to_upper(string),
    stringr::str_to_sentence(string)
    )

}
