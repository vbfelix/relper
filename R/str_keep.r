#' Keep only a type of character in the string
#'
#' @description Keep only a type of character in the string
#'
#' @eval arg_vector("string","character")
#' @eval arg_value("keep","character",default = "'text'",action = "will be the type of character to keep")
#'
#' @return character vector
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

str_keep <- function(string,keep = "text"){

  if(!relper::is_string(string)){stop("'string' must be a character.")}

  if(!relper::is_string(keep)){stop("'keep' must be a character.")}

  keep <- tolower(keep)

  keep_text <- c("text","char","character","string","word")

  keep_num <- c("numeric","number","num","numbers")

  keep_special <- c("special")

  keep_ref <- c(keep_text,keep_num,keep_special)

  keep_stop <- paste(keep_ref,collapse = ", ")

  if(relper::isnot_in(keep,keep_ref)){stop("'keep' must be one of: ", keep_stop)}

  if(keep %in% keep_text){
    output <- gsub("[^a-zA-Z]", "", string)
  }

  if(keep %in% keep_num){
    output <- gsub("[^0-9]", "", string)
  }

  if(keep %in% keep_special){
    output <- gsub("[0-9a-zA-Z]", "", string)
  }

  return(output)

}


