#' Correlation/association computation
#'
#' @description Computation of correlation/association coefficients.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("type","character",action = "is the type of the correlation to be computed")
#'
#' @details Currently, it is possible to compute the following metrics:

#'
#' @return A numeric single value with the computed value.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100,1)
#'
#' calc_correlation(x)
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

  if(type == "phi"){
    if(length(y_values) != 2){
      stop("argument 'y' must be dichotomous")
    }
    if(length(x_values) != 2){
      stop("argument 'x' must be dichotomous")
    }
  }


  type_corr <- c("biserial","kendall","pearson","spearmann")

  type_ord <- c("goodman_kruskal","phi","polychoric")

  type_ref <- c(type_corr,type_ord)

  stop_one_of(arg = type,one_of = type_ref)

  n <- length(x)

  # if(type %in% ){
  #   tbl_xy <- table(x, y)
  #
  #   row_sum <- apply(tbl_xy, 1, sum)
  #
  #   col_sum <- apply(tbl_xy, 2, sum)
  # }

  # biserial -----------------------------------------------------------------

  if(type == "biserial"){

    output <- cor(x = x,y = y,use = "na.or.complete",method = "pearson")

  }

  # goodman kruskal gamma -----------------------------------------------------------------

  if(type == "goodman_kruskal"){

    dividend <- sum(row_sum * col_sum * tbl_xy) - sum(x,na.rm = TRUE) * sum(y,na.rm = TRUE)

    divisor <- sum(row_sum * col_sum * tbl_xy) + sum(x,na.rm = TRUE) * sum(y,na.rm = TRUE)

    output <- dividend/divisor

  }

  # kendall_tau -----------------------------------------------------------------

  if(type == "kendall"){

    output <- cor(x = x,y = y,use = "na.or.complete",method = "kendall")

  }

  # pearson -----------------------------------------------------------------

  if(type == "pearson"){

    output <- cor(x = x,y = y,use = "na.or.complete",method = "pearson")

  }

  # phi -----------------------------------------------------------------

  if(type == "phi"){

    dividend <- tbl_xy[1,1] * tbl_xy[2,2] - tbl_xy[1,2] * tbl_xy[2,1]

    divisor <- sqrt(row_sum[1] * row_sum[2] * col_sum[1] * col_sum[2])

    output <- dividend/divisor

  }

  # polychoric  -----------------------------------------------------------------

  if(type == "polychoric"){

    chi_square <- sum((tbl_xy - (row_sum %*% t(col_sum)) / sum(tbl_xy))^2 / ((row_sum %*% t(col_sum)) / sum(tbl_xy)))

    dof <- (length(row_sum) - 1) * (length(col_sum) - 1)

    output <- sqrt(chi_square / (sum(tbl_xy) * dof))
  }

  # spearmann -----------------------------------------------------------------

  if(type == "spearmann"){

    output <- cor(x = x,y = y,use = "na.or.complete",method = "spearmann")

  }

  return(output)

}
