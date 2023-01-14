#' Summary  of numeric variables
#'
#' @description Summary statistics for numeric variables.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_boolean("minimal",action = "return a minimal version of the summary")
#'
#' @return A tibble with:
#' \cr
#' \cr - n: the number of observations;
#' \cr - na: the number of missing values;
#' \cr - negative: the number of negative values;
#' \cr - equal_zero: the number of values equal to zero;
#' \cr - positive: the number of positive values;
#' \cr - min: the minimum;
#' \cr - p25: the first quartile;
#' \cr - p50: the second quartile (median);
#' \cr - p75: the third quartile;
#' \cr - max: the maximum;
#' \cr - mode: the peak density value;
#' \cr - mean: the mean;
#' \cr - cv: the coefficient of variation.
#'
#'
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

  stop_function(arg = x,type = "numeric")

  stop_function(arg = minimal,type = "logical",single_value = TRUE)

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

