#' Spread with multiple variables
#'
#' @description Compute summary statistics for data
#'
#' @param df data.frame
#' @param key key variable name
#' @param value value variable name
#'
#' @return tibble
#' @export
#'
#' @examples
#'
#'

mult_spread <- function(df, key, value) {

  keyq <- rlang::enquo(key)

  valueq <- rlang::enquo(value)

  s <- rlang::quos(!!valueq)

  df %>%
    tidyr::gather(variable, value, !!!s) %>%
    tidyr::unite(temp, variable,!!keyq ) %>%
    tidyr::spread(temp, value)
}
