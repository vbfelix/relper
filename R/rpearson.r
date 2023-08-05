#' Generate two variables linear correlated
#'
#' @description Simulates two numeric variables linear correlated,
#'  given a Pearson linear correlation coefficient, that also follows a normal distribution.
#'
#' @eval arg_number_of("n",default = "25",number_of = "observations to simulate")
#' @eval arg_value("pearson","numeric",default = "0.50",action = "will be the expected Pearson linear correlation coefficient")
#' @eval arg_value("tol","numeric",default = "0.10",action = "will be the tolerance between the simulated and estimated correlation")
#' @eval arg_value("mean","numeric",default = "0",action = "will be the mean of the simulated data")
#' @eval arg_value("sd","numeric",default = "1",action = "will be the standard deviation of the simulated data")
#'
#' @return A tibble (nx2) with two numeric variables (x and y).
#'
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

    stopifnot(relper::is_integer(n),length(n) == 1, n > 3)

    stopifnot(is.numeric(pearson),length(n) == 1,pearson >= -1 & pearson <= 1)

    stopifnot(is.numeric(tol), length(tol) == 1, tol >=0 & tol <= 1)

    stopifnot(is.numeric(mean), length(mean) == 1)

    stopifnot(is.numeric(sd), length(sd) == 1)

    if((tol > 0) & (tol < .05)){
      warning("A low tolerance may cause a infinite loop or a long simulation time.")
    }

    p_stop <- 1

    while (p_stop > tol) {

      x <- stats::rnorm(n,mean = mean, sd = sd)

      y <- stats::rnorm(length(x), pearson*x, sqrt(1-pearson^2))

      p_est <- stats::cor(x,y)

      p_stop <- abs(pearson - p_est)

    }

    output <-
      dplyr::tibble(
        x = x,
        y = y
      )

    return(output)

  }

