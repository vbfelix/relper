#' Breaks data by quantile
#'
#' @description Breaks data by quantile
#'
#' @param x numeric vector.
#' @param q numeric vector of quantiles.
#'
#' @return breaks
#' @export
#'
#' @examples
#' x <- rnorm(100)
#' cut_quantile(x)
cut_quantile <- function(x, q = seq(0,1,by = .20) ) {

  cut(x,
      breaks = quantile(x,probs = q,na.rm = T),
      include.lowest = T,
      right = T)

}
