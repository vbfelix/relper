#' calc_cramers_v
#'
#' @description Computes Cramer's V
#'
#' @param chi_square object from the application of the function chisq.test
#' @return numeric vector
#' @export
#'
#' @examples
#'
#'x <- matrix(c(12, 5, 7, 7), ncol = 2)
#'
#'chi_square <- chisq.test(x)
#'
#'calc_cramers_v(chi_square)
#'
#'

calc_cramers_v <-
  function(chi_square){

    if(!is.list(chi_square)){"'chi_square' must be a list."}

    if(names(chi_square[["statistic"]]) != "X-squared"){"'chi_square1' must be an object from chisq.test()."}

    stat <- as.numeric(chi_square[["statistic"]])

    n <- sum(chi_square[["observed"]])

    k <- min(dim(chi_square[["observed"]]))

    sqrt(stat/(n * (k - 1)))

  }
