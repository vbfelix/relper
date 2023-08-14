#' Coerce character to numeric
#'
#' @description Coerce a character vector to numeric, by:
#'  \cr
#'  \cr  - Removing the thousand separator mark.
#'  \cr  - Replacing decimal mark with a dot.
#'  \cr  - Removing the character "$".
#'  \cr  - Removing the characters from the alphabet.
#'  \cr  - Trimming extra spaces.
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

as_num <-
  function(
    x,
    thousand_mark = "\\.",
    decimal_mark = "\\,"
  ){

    stopifnot(is.character(x))

    stopifnot(is.character(thousand_mark), length(thousand_mark) == 1)

    stopifnot(is.character(decimal_mark), length(decimal_mark) == 1)

    output <-
      x %>%
      # Remove thousand marker
      gsub(x = .,pattern = thousand_mark,replacement =  "") %>%
      # Sub decimal marker to "."
      gsub(x = .,pattern = decimal_mark,replacement =  "\\.") %>%
      # Remove "$"
      gsub(x = .,pattern = "\\$",replacement =  "") %>%
      # Remove letters
      gsub(x = .,pattern = "[a-zA-Z]",replacement =  "") %>%
      # Remove blank spaces
      gsub(x = .,pattern = " ",replacement =  "") %>%
      as.numeric(., na.rm = FALSE)

    warn_any_na(output)

    return(output)

  }

