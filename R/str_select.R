#' Select string
#'
#' @description Select string: before, after or between patterns
#'
#' @param string character value
#' @param after first pattern
#' @param before second pattern
#'
#' @return character value
#' @export
#'
#' @examples
#'
#'string <- "example text STRING1 TARGET STRING2 example text"
#'
#'#Select a string, before a pattern
#'str_select(string,before = "STRING2")
#'
#'#Select a string, after a pattern
#'str_select(string,after = "STRING1")
#'
#'#Select a string, between two patterns
#'str_select(string,"STRING1","STRING2")

str_select <- function(string,after = NULL,before = NULL){

  if(is.character(string) == F & is.factor(string) == F){
    stop("string must be a characther/factor")
  }

  if( !is.null(after) & is.character(after) == F & is.factor(after) == F){
    stop("after must be a characther/factor")
  }

  if( !is.null(before) & is.character(before) == F & is.factor(before) == F){
    stop("before must be a characther/factor")
  }

  if((!is.null(before)) & (!is.null(after)) ){
    out <- stringr::str_match(string, paste0(after,"\\s*(.*?)\\s*",before))
    out <- out[,2]
  }

  if((!is.null(before)) & (is.null(after)) ){
    out <- sub(paste0(before,".*"),"",string)
  }

  if((is.null(before)) & (!is.null(after)) ){
    out <- sub(paste0(".*",after),"",string)
  }

  return(out)
}
