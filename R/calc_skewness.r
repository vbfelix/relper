#' Skewness computation
#'
#' @description Computation of the skewness, a measure of the asymmetry.
#' This metric can be used to determine the shape of a variable,
#'  and whether it is symmetric or skewed.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("type","character",action = "is the type of the skewness to be computed")
#'
#' @details Currently, it is possible to compute the following metrics:
#'
#' \cr - Bowley skewness coefficient
#' \cr - Fisher-Pearson skewness coefficient
#' \cr - Kelly skewness coefficient
#' \cr - Rao skewness coefficient
#' \cr - Pearson median skewness coefficient
#'
#' @return A numeric single value with the computed value.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_skewness(x)
#'

calc_skewness <-
  function(
    x,
    type = c("fisher_pearson","bowley","kelly","pearson_median","rao")
  ){

    stopifnot(is.numeric(x),length(x) > 1)

    stopifnot(is.character(type))

    type <- match.arg(type)

    x_min <- min(x,na.rm = TRUE)

    x_max <- max(x,na.rm = TRUE)

    x_mean <- mean(x,na.rm = TRUE)

    x_median <- stats::median(x,na.rm = TRUE)

    x_q3 <- stats::quantile(x = x,probs = .75,na.rm = TRUE)

    x_q1 <- stats::quantile(x = x,probs = .25,na.rm = TRUE)

    x_p90 <- stats::quantile(x = x,probs = .90,na.rm = TRUE)

    x_p10 <- stats::quantile(x = x,probs = .10,na.rm = TRUE)

    x_sd <- stats::sd(x,na.rm = TRUE)

    n <- length(x)

    # bowley ------------------------------------------------------------------

    if(type == "bowley"){

      dividend <- x_q3 + x_q1 - (2 * x_median)

      divisor <- x_q3 - x_q1

    }

    # fisher pearson ----------------------------------------------------------

    if(type == "fisher_pearson"){

      dividend <- sum((x - x_mean)^3,na.rm = TRUE)

      divisor <- n*x_sd^3

    }

    # kelly ----------------------------------------------------------

    if(type == "kelly"){

      dividend <- x_p90 + x_p10 - (2 * x_median)

      divisor <- x_p90 - x_p10

    }


    # rao ----------------------------------------------------------

    if(type == "rao"){

      dividend <-  (n / (n - 1)) * (x_mean - x_median)

      divisor <- sqrt((n - 2) / n)

    }


    # pearson_median ----------------------------------------------------------

    if(type == "pearson_median"){

      dividend <- 3 * (x_mean - x_median)

      divisor <- x_sd

    }

    # output ------------------------------------------------------------------

    output <- dividend/divisor

    return(unname(output))

  }
