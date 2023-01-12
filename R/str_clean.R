#' Remove punctuation and/or accent
#'
#' @description Remove punctuation and/or accent
#'
#' @eval arg_vector("string","character")
#' @eval arg_boolean("remove_accent","remove accent symbols from the string","TRUE")
#' @eval arg_boolean("remove_punct","remove punctuation symbols from the string","TRUE")
#' @eval arg_value("sub_punct","character",default = "",action = "will be replace for the punctuation symbols")
#'
#' @return character value
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

  if(!relper::is_string(string)){stop("'string' must be a character.")}

  if(!is.logical(remove_accent)){stop("'remove_accent' must be logical.")}

  if(!is.logical(remove_punct)){stop("'remove_punct' must be logical.")}

  if(!is.character(sub_punct)){stop("'sub_punct' must be a character.")}

  if(length(sub_punct) > 1){stop("'sub_punct' must be a single value.")}

  if(remove_punct){
    string <- gsub("[[:punct:]]",sub_punct, string)
  }

  if(remove_accent){
    string <- iconv(string, from = Encoding(string), to = 'ASCII//TRANSLIT')
  }

  return(string)
}


