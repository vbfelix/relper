#' Format numeric data
#'
#' @description Format data as "10.500,25"
#'
#' @param x numeric vector
#' @param digits number of decimals digits
#' @param dec_mark decimal mark
#' @param mil_mark tgousand mark
#'
#' @return formatted data
#' @export
#'
#' @examples
#'
#' num_format(12345.67)
#'

num_format <- function(x, digits = 2,decimal_mark = ",",thousand_mark = "."){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  if(is.numeric(digits) == F){
    stop("digits must be numeric")
  }

  formatC(x,
          format="f",
          big.mark = thousand_mark,
          digits = digits,
          decimal.mark = decimal_mark)

}

