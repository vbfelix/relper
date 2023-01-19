#' Summary of a numeric variable
#'
#' @description Summary statistics for numeric variables.
#'
#' @details By default the summary statistics are:
#' \cr - min: the minimum;
#' \cr - p25: the first quartile;
#' \cr - p50: the second quartile (median);
#' \cr - p75: the third quartile;
#' \cr - max: the maximum;
#' \cr - mode: the peak density value;
#' \cr - mean: the mean;
#' \cr - cv: the coefficient of variation.
#'
#' If `type` = TRUE, the following metrics will be added:
#' \cr - n: the number of observations;
#' \cr - na: the number of missing values;
#' \cr - negative: the number of negative values;
#' \cr - equal_zero: the number of values equal to zero;
#' \cr - positive: the number of positive values.
#'
#' If `other_means` = TRUE, the following metrics will be added:
#' \cr - geometric_mean: the geometric mean;
#' \cr - harmonic_mean: the harmonic mean.
#'
#' If `skewness` = TRUE, the following metrics will be added:
#' \cr - Bowley
#' \cr - Fisher-Pearson
#' \cr - Kelly
#' \cr - Rao
#' \cr - Pearson median
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_boolean("type",action = "add metrics related to the variables type", default = "TRUE")
#' @eval arg_boolean("other_means",action = "add the harmonic and geometric means")
#' @eval arg_boolean("skewness",action = "add the skewness metrics")
#'
#'
#' @return A tibble with the summary metrics.
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

summary_num <- function(x, type = FALSE, other_means = FALSE){

  stop_function(arg = x,type = "numeric")

  stop_function(arg = type,type = "logical",single_value = TRUE)

  stop_function(arg = other_means,type = "logical",single_value = TRUE)

  output <-
    dplyr::tibble(
      min = min(x, na.rm = TRUE),
      p25 = stats::quantile(x,probs = .25, na.rm = TRUE),
      p50 = stats::median(x, na.rm = TRUE),
      p75 = stats::quantile(x,probs = .75, na.rm = TRUE),
      max = max(x, na.rm = TRUE),
      mode = dplyr::if_else(
        condition = length(stats::na.omit(x)) < 3,
        true = NA_real_ ,
        false = relper::calc_peak_density(stats::na.omit(x))),
      mean = mean(x, na.rm = TRUE),
      cv = relper::calc_cv(x)
    )


  if(!type){
    output <-
      dplyr::tibble(
        n = length(x),
        na = sum(is.na(x)),
        negative = sum(x < 0, na.rm = TRUE),
        equal_zero = sum(x == 0, na.rm = TRUE),
        positive = sum(x > 0, na.rm = TRUE)
      )
    dplyr::bind_cols(output)
  }

  if(!other_means){
    output <-
      output %>%
      dplyr::bind_cols(
        dplyr::tibble(
          geometric_mean = relper::calc_geometric_mean(x = x),
          harmonic_mean = relper::calc_harmonic_mean(x = x)
        )
      )
  }

  if(!skewness){
    output <-
      output %>%
      dplyr::bind_cols(
        dplyr::tibble(
          bowley_skewness = relper::calc_skewness(x = x,type = "bowley"),
          fisher_pearson_skewness = relper::calc_skewness(x = x,type = "fisher_pearson"),
          kelly_skewness = relper::calc_skewness(x = x,type = "kelly"),
          pearson_skewness = relper::calc_skewness(x = x,type = "pearson_median"),
          rao_skewness = relper::calc_skewness(x = x,type = "rao")        )
      )
  }

  return(output)

}

