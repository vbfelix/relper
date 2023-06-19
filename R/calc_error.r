#' Compute error metrics
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

  stop_function(arg = x,type = "numeric",length_bigger = 2)

  stop_function(arg = y,type = "numeric",length_bigger = 2)

  stop_two_args(arg1 = x, arg2 = y, equal_length = TRUE)

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
