#' Format numeric data
#'
#' @description Format data as "10.500,25"
#'
#' @param x numeric vector
#' @param digits number of decimals digits
#'
#' @return formatted data
#' @export
#'
#' @examples
#'
#' num_format(12345.67)
#'

num_format <- function(x,digits = 2){

  formatC(x,
          format="f",
          big.mark = ".",
          digits = digits,
          decimal.mark = ",")

}

