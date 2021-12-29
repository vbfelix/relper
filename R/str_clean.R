#' Remove punctuation and/or accent
#'
#' @description Remove punctuation and/or accent
#'
#' @param string character value
#' @param accent logical value to remove accent (default = T)
#' @param punct logical value to remove punctuation (default = T)
#' @param sub character value to replace punctuation (default = "")
#'
#' @return character value
#' @export
#'
#' @examples
#'
#'string <- "a..;éâ...íõ"
#'
#'#remove only punctuation
#'str_clean(string,accent = F,punct = T)
#'
#'#remove only accent
#'str_clean(string,accent = T,punct = F)
#'
#'#remove both
#'str_clean(string)


str_clean <-
  function(
    string,
    accent = TRUE,
    punct = TRUE,
    sub = ""
    ){

  if(!is.character(string) & !is.factor(string)){
    stop("string must be a characther/factor.")
  }

  if(!is.character(sub) & !is.factor(sub)){
    stop("sub must be a characther/factor.")
  }

  if(punct){
    string <- gsub("[[:punct:]]",sub, string)
  }

  if(accent){
    string <- iconv(string, from = 'UTF-8', to = 'ASCII//TRANSLIT')
  }

  return(string)
}


