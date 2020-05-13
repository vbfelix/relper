#' Two Digits
#'
#' @description Format 1 as "01"
#'
#' @param x numeric vector
#' @return character vector
#' @export
#'
#' @examples
#'
#' x <- c(1,4,10,12)
#'
#' two_digit(x)
#'

two_digit <- function(x){

  ifelse(nchar(x)==1,
         paste0("0",x),
         x)

  }

