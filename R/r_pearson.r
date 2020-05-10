#' Correlated linear data generator
#'
#' @description Simulates
#'
#' @param n number of observations
#' @param p pearson linear correlation coefficient
#'
#' @return data.frame with 2 numeric correlated
#' @export
#'
#' @examples
#'
#' plot(r_pearson(100,.8,mean = 3))
#'

r_pearson<- function(n,p = .5,...){

  x <- rnorm(n,...)

  y <- rnorm(length(x), p*x, sqrt(1-p^2))

  out <- data.frame(x = x,
                    y = y,
                    p = p)

  return(out)

}
