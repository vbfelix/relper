#' Format numeric data
#'
#' @description Format data as "10.500,25"
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_number_of("digits","decimal digits")
#' @eval arg_mark("decimal")
#' @eval arg_mark("thousand")
#' @eval arg_boolean("br_mark","set decimal_mark = ',' and thousand_mark = '.'")
#'
#' @return formatted data
#' @export
#'
#' @examples
#'
#' format_num(12345.67)
#'

format_num <-
  function(x, digits = 2,decimal_mark = ".",thousand_mark = ",", br_mark = FALSE){

    if(!is.numeric(x)){stop("'x' must be numeric.")}

    if(!is.numeric(digits)){stop("'digits' must be numeric.")}

    if(!is.character(decimal_mark)){stop("'decimal_mark' must be a character.")}

    if(!is.character(thousand_mark)){stop("'thousand_mark' must be a character.")}

    if(!is.logical(br_mark)){stop("'br_mark' must be logical.")}

    if(br_mark){
      decimal_mark <- ","
      thousand_mark <- "."
    }

    formatC(
      x,
      format = "f",
      big.mark = thousand_mark,
      digits = digits,
      decimal.mark = decimal_mark
    )
  }

