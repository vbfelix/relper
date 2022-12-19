#' Outlier
#'
#' @description return TRUE if the value is an outlier (boxplot criteria)
#'
#' @param x numeric vector
#'
#' @return Numeric vector
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

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  q1 <- quantile(x, 0.25, na.rm = TRUE)

  q3 <- quantile(x, 0.75, na.rm = TRUE)

  iqr  <- q3 - q1

  lower_limit <- q1 - (1.5 * iqr)

  upper_limit <- q3 + (1.5 * iqr)

  output <- dplyr::if_else((x <= lower_limit) | (x >= upper_limit), TRUE, FALSE)

  return(output)

}
