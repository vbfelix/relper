#' Numeric summary
#'
#' @description Compute summary statistics for numeric variable
#'
#' @param x numeric vector
#' @param minimal return minimal version (default = F)
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

num_summary <- function(x, minimal = F){

  if(is.numeric(x) == F){
    stop("x must be numeric")
  }

  if(minimal == F){
    out <-
      dplyr::tibble(
        n = length(x),
        na = sum(is.na(x)),
        negative = sum(x < 0, na.rm = T),
        equal_zero = sum(x == 0, na.rm = T),
        positive = sum(x > 0, na.rm = T),
        min  = min(x, na.rm = T),
        p25  = quantile(x,probs = .25, na.rm = T),
        p50  = median(x, na.rm = T),
        p75  = quantile(x,probs = .75, na.rm = T),
        max = max(x, na.rm = T),
        mode = ifelse(length(na.omit(x) ) < 3, NA_real_ ,relper::num_mode(na.omit(x))),
        mean = mean(x, na.rm = T),
        cv = relper::cv(x)
      )
  }else{
    out <-
      dplyr::tibble(
        n = length(x),
        min  = min(x, na.rm = T),
        p25  = quantile(x,probs = .25, na.rm = T),
        p50  = median(x, na.rm = T),
        p75  = quantile(x,probs = .75, na.rm = T),
        max = max(x, na.rm = T),
        mode = ifelse(length(na.omit(x)) < 3, NA_real_ ,relper::num_mode(na.omit(x))),
        mean = mean(x, na.rm = T),
        cv = relper::cv(x)
      )
  }



  return(out)

}

