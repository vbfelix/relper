#' two_digit
#'
#' @description Format numbers < 10, e.g., 1 as "01"
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_number_of("digits","length to add zeroes")
#'
#' @return character vector
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

  rep_num <- dplyr::if_else(rep_num < 0,0,rep_num)

  paste0(sapply(rep_num,FUN = function(x) paste0(rep("0",times = x),collapse = "")),x)

  }

