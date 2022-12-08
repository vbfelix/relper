#' Remove punctuation and/or accent
#'
#' @description Remove punctuation and/or accent
#'
#' @param string character value
#' @param remove_accent logical value to remove accent (default = TRUE)
#' @param remove_punct logical value to remove punctuation (default = TRUE)
#' @param sub_punct character value to replace punctuation (default = "")
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

  if(!is.character(string) & !is.factor(string)){
    stop("string must be a character/factor.")
  }

  if(!is.logical(remove_accent)){stop("'remove_accent' must be logical.")}

  if(!is.logical(remove_punct)){stop("'remove_punct' must be logical.")}

  if(!is.character(sub_punct)){stop("'sub_punct' must be a character.")}

  if(remove_punct){
    string <- gsub("[[:punct:]]",sub_punct, string)
  }

  if(remove_accent){
    string <- iconv(string, from = Encoding(string), to = 'ASCII//TRANSLIT')
  }

  return(string)
}


