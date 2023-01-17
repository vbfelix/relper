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

  output <-
    x %>%
    gsub(x = .,pattern = thousand_mark,replacement =  "") %>%
    gsub(x = .,pattern = decimal_mark,replacement =  "\\.") %>%
    gsub(x = .,pattern = "\\$",replacement =  "") %>%
    gsub(x = .,pattern = "[a-zA-Z]",replacement =  "") %>%
    gsub(x = .,pattern = " ",replacement =  "") %>%
    as.numeric(., na.rm = FALSE)

  if(any(is.na((output)))){warning("some values of 'x' were coerced to NA's")}

  return(output)

}

