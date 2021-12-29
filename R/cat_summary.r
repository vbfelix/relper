#' Categoric summary
#'
#' @description Compute summary statistics for categoric variable
#'
#' @param x characther/factor vector
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
#' cat_summary(x)
#'

cat_summary <- function(x){

  if(!is.character(x) & !is.factor(x)){
    stop("x must be character/factor.")
  }

  out <-
    dplyr::tibble(
      n = length(x),
      na = sum(is.na(x),na.rm = TRUE),
      blank_space = sum(x == "",na.rm = TRUE),
      n_distinct = dplyr::n_distinct(x[relper::not_na(x)]),
      mode = cat_mode(x[relper::not_na(x)])
    )

  return(out)

}
