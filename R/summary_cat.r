#' Summary of categorical variables
#'
#' @description Summary statistics for categoric variables.
#'
#' @eval arg_vector("x","character")
#'
#' @return A tibble with:
#' \cr
#' \cr - n: the number of observations;
#' \cr - na: the number of missing values;
#' \cr - blank_space: the number of values blank ("");
#' \cr - n_distinct: the number of distinct levels;
#' \cr - mode: the mode.
#'
#'
#' @export
#'
#' @examples
#'
#' x <- c(sample(letters,100,replace = TRUE),NA)
#'
#' x
#'
#' summary_cat(x)
#'

summary_cat <- function(x){

  stop_function(arg = x,type = "string")

  output <-
    dplyr::tibble(
      n = length(x),
      na = sum(is.na(x),na.rm = TRUE),
      blank_space = sum(x == "",na.rm = TRUE),
      n_distinct = dplyr::n_distinct(x[relper::isnot_na(x)]),
      mode = paste(relper::calc_mode(x[relper::isnot_na(x)]),collapse = ", "),
      modality = relper::calc_modality(x)
    )

  return(output)

}


