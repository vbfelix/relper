#' Numeric summary
#'
#' @description Compute summary statistics for numeric variable
#'
#' @param x numeric vector
#'
#' @return tibble
#' @export
#'
#' @examples
#'
#' x <- c(rnorm(10),NA,10)
#'
#' x
#'
#' num_summary(x)
#'

num_summary <- function(x){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  out <-
  dplyr::tibble(
    n = length(x),
    na = sum(is.na(x)),
    outlier = sum(relper::is_outlier(x),na.rm = T),
    negative = sum(x < 0, na.rm = T),
    equal_zero = sum(x == 0, na.rm = T),
    positive = sum(x > 0, na.rm = T),
    min  = min(x, na.rm = T),
    p25  = quantile(x,probs = .25, na.rm = T),
    p50  = median(x, na.rm = T),
    p75  = quantile(x,probs = .75, na.rm = T),
    max = max(x, na.rm = T),
    mean = mean(x, na.rm = T),
    cv = relper::cv(x)
  )

  return(out)

}

