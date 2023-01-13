#' Remove punctuation and/or accent from a string
#'
#' @description Remove punctuation and/or accent from a string.
#'
#' @eval arg_vector("string","character")
#' @eval arg_boolean("remove_accent","remove accent symbols from the string","TRUE")
#' @eval arg_boolean("remove_punct","remove punctuation symbols from the string","TRUE")
#' @eval arg_value("sub_punct","character",default = "''",action = "will be replacement for the punctuation symbols")
#'
#' @return A character vector.
#'
#' @export
#'
#' @examples
#'
#'string <- "a..;éâ...íõ"
#'
#'#remove only punctuation
#'str_clean(string,remove_accent = FALSE,remove_punct = TRUE)
#'
#'#remove only accent
#'str_clean(string,remove_accent = TRUE,remove_punct = FALSE)
#'
#'#remove both
#'str_clean(string)


str_clean <-
  function(
    string,
    remove_accent = TRUE,
    remove_punct = TRUE,
    sub_punct = ""
  ){

    stop_function(arg = string,type = "string")

    stop_function(arg = remove_accent,type = "logical",single_value = TRUE)

    stop_function(arg = remove_punct,type = "logical",single_value = TRUE)

    stop_function(arg = sub_punct,type = "character",single_value = TRUE)

    if(remove_punct){
      string <- gsub("[[:punct:]]",sub_punct, string)
    }

    if(remove_accent){
      string <- iconv(string, from = Encoding(string), to = 'ASCII//TRANSLIT')
    }

    return(string)
  }


