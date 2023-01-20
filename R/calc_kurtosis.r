#' Kurtosis computation
#'
#' @description Computation of the kurtosis, a measure of the "peakedness".
#'  This metric can be used to determine the shape of a dataset,
#'   and whether it is platykurtic (flatter than a normal distribution),
#'    mesokurtic (same kurtosis as a normal distribution),
#'     or leptokurtic (more peaked than a normal distribution).
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("type","character",action = "is the type of the kurtosis to be computed")
#'
#' @details Currently, it is possible to compute the following metrics:
#' \cr - Biased
#' \cr - Excess
#' \cr - Percentile
#' \cr - Unbiased
#'
#' @return A numeric single value with the computed value.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_kurtosis(x)
#'

calc_kurtosis <- function(x,type = "unbiased"){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  stop_function(arg = type,type = "character")

  type_ref <- c("biased","excess","percentile","unbiased")

  stop_one_of(arg = type,one_of = type_ref)

  x_mean <- mean(x,na.rm = TRUE)

  x_sd <- stats::sd(x,na.rm = TRUE)

  n <- length(x)


# biased -----------------------------------------------------------------

  if(type == "biased"){

    dividend <- sum((x - x_mean)^4,na.rm = TRUE)

    divisor <- n*x_sd^4

    output <- dividend/divisor

  }

# excess ------------------------------------------------------------------

  if(type == "excess"){

    dividend <- sum((x - x_mean)^4,na.rm = TRUE)

    divisor <- n*x_sd^4

    output <- (dividend/divisor) - 3

  }


# percentile --------------------------------------------------------------

  if(type == "percentile"){

    dividend <- IQR(x,na.rm = TRUE)/2

    divisor <- quantile(x,probs = .9,na.rm = TRUE) - quantile(x,probs = .1,na.rm = TRUE)

    output <- dividend/divisor

  }

# unbiased -----------------------------------------------------------------

  if(type == "unbiased"){

    constant <- ( (n*(n+1)) / ( (n-1)*(n-2)*(n-3) ) )

    dividend <- sum((x - x_mean)^4,na.rm = TRUE)

    divisor <- n*x_sd^4

    add <- (3*(n-1)^2) / ( (n-2)*(n-3) )

    output <- (constant*dividend/divisor) - add

  }



  return(output)

}
