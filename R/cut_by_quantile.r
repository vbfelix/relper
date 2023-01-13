#' Convert numeric to factor
#'
#' @description Divides the range of a numeric vector by the quantiles provided (q).
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("q","numeric")
#'
#' @return A factor vector withe interval range of the quantiles.
#'
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' cut_by_quantile(x)
#'


cut_by_quantile <- function(x, q = seq(0,1,by = .20),...) {

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  stop_function(arg = q,type = "numeric",length_bigger = 1,range = c(0,1))

  cut(x,
      breaks = quantile(x,probs = q,na.rm = TRUE),
      ...,
      include.lowest = TRUE,
      right = TRUE
      )

}
