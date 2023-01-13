#' Format value to complete with zeroes to the left
#'
#' @description Format value to complete with zeroes to the left until a certain size,
#'  e.g., considering a size of 2: 1 -> "01".
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_number_of("digits",default = "2",number_of = "length to add zeroes")
#'
#' @return A character vector with zeroes added to the left to achieve the character size.
#'
#' @export
#'
#' @examples
#'
#' x <- c(1,4,10,12)
#'
#' format_digit(x)
#'

format_digit <- function(x, digits = 2){

  stop_function(arg = digits,type = "integer",bigger_than = 2,single_value = TRUE)

  x <- as.character(x)

  rep_num <- digits - nchar(x)

  rep_num <-
    dplyr::if_else(
      condition = rep_num < 0,
      true = 0,
      false = rep_num
      )

  paste0(sapply(rep_num,FUN = function(x) paste0(rep("0",times = x),collapse = "")),x)

  }

