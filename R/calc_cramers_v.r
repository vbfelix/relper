#' Cramer's V computation
#'
#' @description Computation of the Cramer's V from a chi-square test.
#'
#' @param chi_square object from the application of the function chisq.test
#'
#' @return A numeric single value with the computed Cramer's V.
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

    stop_function(arg = chi_square,type = "list")

    if(names(chi_square[["statistic"]]) != "X-squared"){"'chi_square' must be an object from chisq.test()."}

    stat <- as.numeric(chi_square[["statistic"]])

    n <- sum(chi_square[["observed"]])

    k <- min(dim(chi_square[["observed"]]))

    sqrt(stat/(n * (k - 1)))

  }
