#' Compute correlation coefficents
#'
#' @description Computation of correlation coefficients.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#' @eval arg_value("type","character",action = "is the type of the correlation to be computed")
#'
#' @details Currently, it is possible to compute the following metrics:
#'
#' \cr - Biserial correlation coefficient
#' \cr - Kendall's Tau correlation coefficient
#' \cr - Pearson linear correlation coefficient
#' \cr - Spearmann correlation coefficient
#'
#' @return A numeric single value with the computed value.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_correlation(x,x)
#'

calc_correlation <- function(x,y,type = "pearson"){

  stop_function(arg = x,type = "numeric",length_bigger = 1)

  stop_function(arg = type,type = "character")

  stop_two_args(arg1 = x,arg2 = y,equal_length = TRUE)

  y_values <- unique(y)

  x_values <- unique(x)

  if(type == "biserial"){
    if(length(y_values) != 2 & length(x_values) > 2){
      stop("argument 'y' must be dichotomous")
    }
    if(length(x_values) != 2 & length(y_values) > 2){
      stop("argument 'x' must be dichotomous")
    }
  }

  type_ref <- c("biserial","kendall","pearson","spearmann")

  stop_one_of(arg = type,one_of = type_ref)

  n <- length(x)

  # biserial -----------------------------------------------------------------

  if(type == "biserial"){

    output <- stats::cor(x = x,y = y,use = "na.or.complete",method = "pearson")

  }

  # kendall -----------------------------------------------------------------

  if(type == "kendall"){

    output <- stats::cor(x = x,y = y,use = "na.or.complete",method = "kendall")

  }

  # pearson -----------------------------------------------------------------

  if(type == "pearson"){

    output <- stats::cor(x = x,y = y,use = "na.or.complete",method = "pearson")

  }

  # spearmann -----------------------------------------------------------------

  if(type == "spearmann"){

    output <- stats::cor(x = x,y = y,use = "na.or.complete",method = "spearmann")

  }

  return(output)

}
