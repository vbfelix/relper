#' Error metrics computation
#'
#' @description Compute error metrics
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#'
#' @return A tibble with the computed error metrics.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' y <- rnorm(100)
#'
#' plot(x,y)
#'
#' calc_error(x,y)
#'

calc_error <- function(x,y){

  stopifnot(is.numeric(x), length(x) > 1)

  stopifnot(is.numeric(y), length(y) > 1)

  stopifnot(length(x) == length(y))

  n <- length(x)

  x_y <- x-y

  output <-
    dplyr::tibble(
      MAE  = sum(abs(x_y),na.rm = TRUE)/n,
      MAPE = sum(abs(x_y/x),na.rm = TRUE)/n,
      MSE  = sum((x_y)^2,na.rm = TRUE)/n,
      RMSE = sqrt(MSE),
      RMSPE  = sqrt(sum((x_y/x)^2,na.rm = TRUE)/n)
    ) %>%
    tidyr::pivot_longer(cols = dplyr::everything(),names_to = "error")

  return(output)

}
