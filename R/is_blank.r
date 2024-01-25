#' Conditional check for a blank value
#'
#' @description Return TRUE if the value is blank.
#'
#' @eval arg_vector("x","")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' is_blank("")
#'
#' is_blank(NA_character_)
#'
#' is_blank(" ")
#'
#' is_blank("-")
#'
#' is_blank(NULL)
#'
#' is_blank(NaN)
#'

is_blank <- function(x){

  if(is.null(x)){

    output <- TRUE

  }else{

    if(relper::is_string(x)){

      x <- stringr::str_trim(x)

      output <- (is.na(x)) | (x == "") | (x == "-")

    }else{

      output <- is.na(x)

    }

  }

  return(output)

}
