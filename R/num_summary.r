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

num_summary <- function(x, minimal = FALSE){

  if(is.numeric(x) == FALSE){
    stop("x must be numeric")
  }

  if(minimal == FALSE){
    out <-
      dplyr::tibble(
        n = length(x),
        na = sum(is.na(x)),
        negative = sum(x < 0, na.rm = TRUE),
        equal_zero = sum(x == 0, na.rm = TRUE),
        positive = sum(x > 0, na.rm = TRUE),
        min  = min(x, na.rm = TRUE),
        p25  = quantile(x,probs = .25, na.rm = TRUE),
        p50  = median(x, na.rm = TRUE),
        p75  = quantile(x,probs = .75, na.rm = TRUE),
        max = max(x, na.rm = TRUE),
        mode = ifelse(length(na.omit(x) ) < 3, NA_real_ ,relper::num_mode(na.omit(x))),
        mean = mean(x, na.rm = TRUE),
        cv = relper::cv(x)
      )
  }else{
    out <-
      dplyr::tibble(
        n = length(x),
        min  = min(x, na.rm = TRUE),
        p25  = quantile(x,probs = .25, na.rm = TRUE),
        p50  = median(x, na.rm = TRUE),
        p75  = quantile(x,probs = .75, na.rm = TRUE),
        max = max(x, na.rm = TRUE),
        mode = ifelse(length(na.omit(x)) < 3, NA_real_ ,relper::num_mode(na.omit(x))),
        mean = mean(x, na.rm = TRUE),
        cv = relper::cv(x)
      )
  }

  return(out)

}

