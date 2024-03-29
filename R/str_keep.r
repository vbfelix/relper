#' Keep only a type of characters in a string
#'
#' @description Keep only a type of characters in a string.
#'
#' @details The argument 'keep' can be one of: 'text', 'number', 'special'.
#'
#' @eval arg_vector("string","character")
#' @eval arg_value("keep","character",default = "'text'",action = "will be the type of character to keep")
#'
#' @return A character vector.
#'
#' @export
#'
#' @examples
#'
#' string <- "1ABCF45Z89$$%#"
#'
#' str_keep(string,keep = "text")
#'
#' str_keep(string,keep = "numbers")
#'
#' str_keep(string,keep = "special")

str_keep <-
  function(string,
           keep = c("text","numbers","special")
  ){

    stopifnot(relper::is_string(string))

    stopifnot(relper::is_string(keep), length(keep) == 1)

    keep_text <- c("text","char","character","string","word")

    keep_num <- c("numeric","number","num","numbers")

    keep_special <- c("special")

    if(keep %in% keep_text){
      output <- gsub("[^a-zA-Z]", "", string)
    }

    if(keep %in% keep_num){
      output <- as.numeric(gsub("[^0-9]", "", string))
    }

    if(keep %in% keep_special){
      output <- gsub("[0-9a-zA-Z]", "", string)
    }

    return(output)

  }

