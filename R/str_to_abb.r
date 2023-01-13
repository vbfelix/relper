#' Convert case of a string
#'
#' @description Apply str_to_upper to strings with number of characters lower than "n_char".
#'
#' @eval arg_vector("string","character")
#' @eval arg_number_of("n_char",default = "3","characters to define as a abbreviation")
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

str_to_abb <- function(string, n_char = 3){

  stop_function(arg = string,type = "string")

  stop_function(arg = n_char,type = "integer",single_value = TRUE,bigger_than = 1)

  dplyr::if_else(
    nchar(string) <= n_char,
    stringr::str_to_upper(string),
    stringr::str_to_sentence(string)
    )

}
