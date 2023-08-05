#' Format numeric value to add marks
#'
#' @description Format value to add a thousand and decimal mark.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_number_of("digits",default = "2",number_of = "decimal digits")
#' @eval arg_mark("decimal",default = "'.'")
#' @eval arg_mark("thousand",default = "','")
#' @eval arg_boolean("br_mark",action = "set decimal_mark = ',' and thousand_mark = '.'")
#'
#' @return A character vector with the formatted vector.
#'
#' @export
#'
#' @examples
#'
#' format_num(12345.67)
#'

format_num <-
  function(x,
           digits = 2,
           decimal_mark = ".",
           thousand_mark = ",",
           br_mark = FALSE){

    stopifnot(is.numeric(x))

    stopifnot(is.numeric(digits), length(digits) == 1)

    digits <- as.integer(digits)

    stopifnot(is.logical(br_mark))

    stopifnot(is.character(decimal_mark))

    stopifnot(is.character(thousand_mark))

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

