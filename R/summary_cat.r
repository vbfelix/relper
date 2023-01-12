#' Categoric summary
#'
#' @description Compute summary statistics for categoric variable
#'
#' @eval arg_vector("string","character")
#'
#' @return tibble
#' @export
#'
#' @examples
#'
#' x <- c(sample(letters,100,re = T),NA)
#'
#' x
#'
#' summary_cat(x)
#'

summary_cat <- function(x){

  if(!is.character(x) & !is.factor(x)){
    stop("x must be character/factor.")
  }

  out <-
    dplyr::tibble(
      n = length(x),
      na = sum(is.na(x),na.rm = TRUE),
      blank_space = sum(x == "",na.rm = TRUE),
      n_distinct = dplyr::n_distinct(x[relper::isnot_na(x)]),
      mode = calc_mode(x[relper::isnot_na(x)])
    )

  return(out)

}
