#' Linear correlated data generator
#'
#' @description Simulates linear correlated data
#'
#' @param n number of observations
#' @param p_sim pearson linear correlation coefficient
#' @param tol tolerance between the simulated and estimated correlation
#'
#' @return data.frame with 2 numeric correlated series and both the simulated and estimated pearson linear coefficient
#' @export
#'
#' @examples
#'
#' plot(r_pearson(n = 100, p_sim = .8,mean = 3))
#'

r_pearson<- function(n = 25,
                     p_sim = 0.50,
                     tol = 0.10,
                     ...){

  if(is.numeric(n)==F){
    stop("n must be numeric")
  }

  if(is.numeric(p_sim)==F){
    stop("p_sim must be numeric")
  }

  if(is.numeric(tol)==F){
    stop("tol must be numeric")
  }

  if(n <= 0){
    stop("n must be > 0")
  }

  if((n%%1)!= 0 ){
    stop("n must be a integer")
  }

  if(tol <= 0 | tol >= 1){
    stop("tol must be (0,1)")
  }

  if(tol > 0 & tol < .05){
    warning("A low tolerance may cause a infinite loop or a long wait time")
  }

  if(p_sim > 1 | p_sim < -1){
    stop("p_sim must be [-1;1]")
  }

  p_stop <- 1

  while (p_stop > tol) {

    x <- rnorm(n,...)

    y <- rnorm(length(x), p_sim*x, sqrt(1-p_sim^2))

    p_est <- cor(x,y)

    p_stop <- abs(p_sim - p_est)

  }

  out <- data.frame(x = x,
                    y = y,
                    p_sim = p_sim,
                    p_est = p_est)

  return(out)

}
