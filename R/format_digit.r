#' two_digit
#'
#' @description Format numbers < 10, e.g., 1 as "01"
#'
#' @param x numeric vector
#' @return character vector
#' @export
#'
#' @examples
#'
#' x <- c(1,4,10,12)
#'
#' format_digits(x)
#'

format_digit <- function(x, digits = 2){

  if(!is.numeric(digits)){stop("digits must be numeric.")}

  if(digits < 2){stop("digits must be > 1.")}

  x <- as.character(x)

  rep_num <- digits - nchar(x)

  rep_num <- ifelse(rep_num < 0,0,rep_num)

  paste0(sapply(rep_num,FUN = function(x)paste0(rep("0",times = x),collapse = "")),x)

  }

