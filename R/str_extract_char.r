#' Extract a specific character from a string
#'
#' @description Extract a specific character from a string.
#'
#' @eval arg_vector("string","character")
#' @eval arg_value("char","integer",default = "1",action = "will be the character position to be extracted")
#'
#' @return A character vector.
#'
#' @export
#'
#' @examples
#'
#' str_extract_char(string = "abcdef")
#'
#' str_extract_char(string = "abcdef", char = 2)
#'
#'

str_extract_char <-
  function(
    string,
    char = 1
  ){

    stop_function(arg = string,type = "string")

    stop_function(arg = char,type = "integer",single_value = TRUE,is_positive = TRUE)

    output <- substr(string, char, char)

    return(output)
  }


