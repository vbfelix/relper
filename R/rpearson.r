#' Linear correlated data generator
#'
#' @description Simulates linear correlated data
#'
#' @param n Number of observations to simulate
#' @param pearson Pearson linear correlation coefficient
#' @param tol Tolerance between the simulated and estimated correlation
#' @param mean Mean of the simulated data
#' @param sd Standard deviation of the simulated data
#'
#' @return data.frame with 2 numeric correlated series and both the simulated and estimated pearson linear coefficient
#' @export
#'
#' @examples
#'
#' df <- rpearson(n = 100, pearson = .8, mean = 3)
#'
#' head(df)
#'
#' plot(df)
#'

rpearson <-
  function(
    n = 25,
    pearson = 0.50,
    tol = 0.10,
    mean = 0,
    sd = 1){

  if(!is.numeric(n)){stop("'n' must be numeric.")}

  if(length(n) > 1){stop("'n' must be a single value.")}

  if(n < 3){stop("'n' must be >= 3.")}

  if((n%%1)!= 0){stop("'n' must be a integer.")}

  if(!is.numeric(pearson)){stop("'pearson' must be numeric.")}

  if(length(pearson) > 1){stop("'pearson' must be a single value.")}

  if((pearson > 1) | (pearson < -1)){stop("pearson must be [-1;1].")}

  if(!is.numeric(tol)){stop("'tol' must be numeric.")}

  if(length(tol) > 1){stop("'tol' must be a single value.")}

  if((tol <= 0) | (tol >= 1)){stop("'tol' must be (0,1).")}

  if((tol > 0) & (tol < .05)){
    warning("A low tolerance may cause a infinite loop or a long simulation time.")
  }

  if(!is.numeric(mean)){stop("'mean' must be numeric.")}

  if(length(mean) > 1){stop("'mean' must be a single value.")}

  if(!is.numeric(sd)){stop("'sd' must be numeric.")}

  if(length(sd) > 1){stop("'sd' must be a single value.")}

  p_stop <- 1

  while (p_stop > tol) {

    x <- rnorm(n,mean = mean, sd = sd)

    y <- rnorm(length(x), pearson*x, sqrt(1-pearson^2))

    p_est <- cor(x,y)

    p_stop <- abs(pearson - p_est)

  }

  output <-
    dplyr::tibble(
      x = x,
      y = y
      )

  cat(n, "observations of x and y were simulated with:",
      "\n - Mean =", mean,"\n - SD =", sd,
      "\n - Linear correlation coefficient =", pearson,
      "\n - Simulation tolerance = ", tol,
      "\n Resulting in a linear correlation coefficient =", p_est ,"\n")

  return(output)

}

