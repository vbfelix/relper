#' Conditional check for an outlier value
#'
#' @description Return TRUE if the value is an outlier (boxplot criteria).
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A boolean vector with the return from the condition check.
#'
#' @export
#'
#' @examples
#'
#' x <- c(rnorm(10),10)
#'
#' x
#'
#' is_outlier(x)
#'

is_outlier <- function(x){

  stop_function(arg = x,type = "numeric")

  q1 <- stats::quantile(x, 0.25, na.rm = TRUE)

  q3 <- stats::quantile(x, 0.75, na.rm = TRUE)

  iqr  <- q3 - q1

  lower_limit <- q1 - (1.5 * iqr)

  upper_limit <- q3 + (1.5 * iqr)

  output <-
    dplyr::if_else(
      condition = (x <= lower_limit) | (x >= upper_limit),
      true =  TRUE,
      false =  FALSE
      )

  return(output)

}
