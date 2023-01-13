#' Coerce character to numeric
#'
#' @description Coerce a character vector to numeric, by:
#'  \cr
#'  \cr  - Removing the thousand separator mark.
#'  \cr  - Replacing decimal mark with a dot.
#'  \cr  - Applying the function as.numeric.
#'
#' @eval arg_vector("x","character")
#' @eval arg_mark("decimal",default = "'\\ \\,'")
#' @eval arg_mark("thousand",default = "'\\ \\.'")
#'
#' @return A numeric vector.
#'
#' @export
#'
#' @examples
#'
#' x <- "10.000,50"
#'
#' as_num(x)
#'

as_num <- function(x, thousand_mark = "\\.", decimal_mark = "\\,"){

  stop_function(arg = x,type = "character")

  stop_function(arg = thousand_mark,type = "character",single_value = TRUE)

  stop_function(arg = decimal_mark,type = "character",single_value = TRUE)

  if(!is.numeric(x)){

    as.numeric(gsub(decimal_mark, "\\.",gsub(thousand_mark, "", x)), na.rm = FALSE)

  }else{

    return(x)

  }

}
