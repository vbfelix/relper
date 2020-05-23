#' Numeric summary
#'
#' @description Compute summary statistics for numeric variable
#'
#' @param x numeric vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
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
    equal_zero = sum(x == 0,na.rm = T),
    min  = min(x,na.rm = T),
    p25  = quantile(x,probs = .25,na.rm = T),
    p50  = median(x,na.rm = T),
    p75  = quantile(x,probs = .75,na.rm = T),
    max = max(x,na.rm = T),
    mean = mean(x,na.rm = T),
    cv = relper::cv(x)
  )

  return(out)

}

