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
#' format_num(12345.67)
#'

format_num <- function(x, digits = 2,decimal_mark = ",",thousand_mark = "."){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(!is.numeric(digits)){stop("'digits' must be numeric.")}

  if(!is.character(decimal_mark)){stop("'decimal_mark' must be a character.")}

  if(!is.character(thousand_mark)){stop("'thousand_mark' must be a character.")}

  formatC(
    x,
    format = "f",
    big.mark = thousand_mark,
    digits = digits,
    decimal.mark = decimal_mark
    )
}

