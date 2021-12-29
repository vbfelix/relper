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
#'


cut_quantile <- function(x, q = seq(0,1,by = .20),...) {

  if(!is.numeric(x)){
    stop("x must be numeric.")
  }

  if(!is.numeric(q)){
    stop("q must be numeric.")
  }

  if((min(q) < 0) | (max(q) > 1)){
    stop("q range must be [0;1].")
  }

  if(length(q) <= 1){
    stop("q length must be > 1.")
  }

  if(length(x) <= 1){
    stop("x length must be > 1.")
  }

  cut(x,
      breaks = quantile(x,probs = q,na.rm = TRUE),
      ...,
      include.lowest = TRUE,
      right = TRUE
      )

}
