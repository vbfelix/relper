#' Select parts of a string, given patterns
#'
#' @description Select parts of a string: before, after or between patterns.
#'
#' @eval arg_vector("string","character")
#' @eval arg_value("after","character",default = "NULL",action = "will be the pattern to select after")
#' @eval arg_value("before","character",default = "NULL",action = "will be the pattern to select before")
#'
#' @return A character vector.
#'
#' @export
#'
#' @examples
#'
#'string <- "begin STRING1 TARGET STRING2 end"
#'#Select a string, before a pattern
#'str_select(string,before = "STRING2")
#'
#'#Select a string, after a pattern
#'str_select(string,after = "STRING1")
#'
#'#Select a string, between two patterns
#'str_select(string,"STRING1","STRING2")

str_select <- function(string,after = NULL,before = NULL){

  stop_function(arg = string,type = "string")

  if(is.null(after) & is.null(before)){stop("arguments 'after' or 'before' must have an input")}

  stop_function(arg = after,type = "string",null = TRUE)

  stop_function(arg = before,type = "string",null = TRUE)

  if((!is.null(before)) & (!is.null(after))){
    output <- stringr::str_match(string, paste0(after,"\\s*(.*?)\\s*",before))
    output <- output[,2]
  }

  if((!is.null(before)) & (is.null(after))){
    output <- sub(paste0(before,".*"),"",string)
  }

  if((is.null(before)) & (!is.null(after))){
    output <- sub(paste0(".*",after),"",string)
  }

  return(output)
}
