#' Numeric summary
#'
#' @description Compute summary statistics for numeric variable
#'
#' @eval arg_vector("string","numeric")
#' @eval arg_boolean("minimal",action = "return a minimal version")
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
#' summary_num(x)
#'

summary_num <- function(x, minimal = FALSE){

  if(!is.numeric(x)){stop("'x' must be numeric.")}

  if(!is.logical(minimal)){stop("'minimal' must be logical.")}

  if(minimal == FALSE){
    output <-
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
        mode = dplyr::if_else(length(na.omit(x)) < 3, NA_real_,relper::calc_peak_density(na.omit(x))),
        mean = mean(x, na.rm = TRUE),
        cv = relper::calc_cv(x)
      )
  }else{
    output <-
      dplyr::tibble(
        n = length(x),
        min  = min(x, na.rm = TRUE),
        p25  = quantile(x,probs = .25, na.rm = TRUE),
        p50  = median(x, na.rm = TRUE),
        p75  = quantile(x,probs = .75, na.rm = TRUE),
        max = max(x, na.rm = TRUE),
        mode = dplyr::if_else(length(na.omit(x)) < 3, NA_real_ ,relper::calc_peak_density(na.omit(x))),
        mean = mean(x, na.rm = TRUE),
        cv = relper::calc_cv(x)
      )
  }

  return(output)

}

