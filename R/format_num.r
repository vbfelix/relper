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

    stop_function(arg = x,type = "numeric")

    stop_function(arg = digits,type = "integer",single_value = TRUE)

    stop_function(arg = br_mark,type = "logical")

    stop_function(arg = decimal_mark,type = "character")

    stop_function(arg = thousand_mark,type = "character")

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

