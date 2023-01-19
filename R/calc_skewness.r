#' Skewness computation
#'
#' @description Computation of the skewness, a measure of the asymmetry.
#' This metric can be used to determine the shape of a variable,
#'  and whether it is symmetric or skewed.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("type","character",action = "is the type of the skewness to be computed")
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
    type = c("bowley","fisher_pearson","kendall","pearson","rao","sample")
  ){

    stop_function(arg = x,type = "numeric",length_bigger = 1)

    stop_function(arg = type,type = "character",single_value = TRUE)

    type_ref <- c("bowley","fisher_pearson","kendall","pearson","rao","sample")

    stop_one_of(arg = type,one_of = type_ref)

    x_min <- min(x,na.rm = TRUE)

    x_max <- max(x,na.rm = TRUE)

    x_mean <- mean(x,na.rm = TRUE)

    x_median <- stats::median(x,na.rm = TRUE)

    x_sd <- stats::sd(x,na.rm = TRUE)

    n <- length(x)

    if(type == "bowley"){

      dividend <- 4 * (x_mean - x_median)

      divisor <- 3 * (x_max - x_min)

    }

    if(type == "fisher_pearson"){

      dividend <- sum((x - x_mean)^3,na.rm = TRUE)

      divisor <- n*x_sd^3

    }

    if(type == "kendall"){

      x_matrix <- matrix(x, ncol = 1)

      dividend <- 3 * (sum((x_matrix - t(x_matrix))^2,na.rm = TRUE) - n * (n - 1))

      divisor <- (n * (n - 1)) * (2 * n + 5)

    }

    if(type == "pearson"){

      dividend <- (n / ((n-1) * (n-2))) * sum((x - x_mean)^3,na.rm = TRUE)

      divisor <- x_sd^3

    }

    if(type == "rao"){

      dividend <-  (n / (n - 1)) * (x_mean - x_median)

      divisor <- sqrt((n - 2) / n)

    }

    if(type == "sample"){

      dividend <- 3 * (x_mean - x_median)

      divisor <- x_sd

    }

    output <- dividend/divisor

    return(output)

  }
