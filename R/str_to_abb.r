#' Convert case of a string, without impacting abbreviations
#'
#' @description Apply str_to_upper to strings with number of characters lower than "n_abb".
#'
#' @eval arg_vector("string","character")
#' @eval arg_number_of("n_abb",default = "3","characters to define as an abbreviation")
#'
#' @return A character vector.
#'
#' @export
#'
#' @examples
#'
#' string <- c("aaaaa","bb","ccc","dddd")
#'
#' str_to_abb(string)
#'

str_to_abb <- function(string, n_abb = 3){

  stopifnot(relper::is_string(string))

  stopifnot(is.numeric(n_abb), length(n_abb) == 1, n_abb > 0)

  n_abb <- as.integer(n_abb)

  dplyr::if_else(
    condition = nchar(string) <= n_abb,
    true = stringr::str_to_upper(string),
    false = stringr::str_to_sentence(string)
    )

}
