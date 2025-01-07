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

    stopifnot(relper::is_string(string))

    stopifnot(is.logical(remove_accent), length(remove_accent) == 1)

    stopifnot(is.logical(remove_punct), length(remove_punct) == 1)

    stopifnot(is.character(sub_punct), length(sub_punct) == 1)

    if(remove_punct){
      string <- gsub("[[:punct:]]",sub_punct, string)
    }

    if(remove_accent){
      string <- iconv(string, to = 'ASCII//TRANSLIT')
    }

    output <- stingr::str_trim(string)

    return(output)
  }


