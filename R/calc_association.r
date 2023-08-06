#' Compute association coefficents
#'
#' @description Computation of association coefficients.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("y","numeric")
#' @eval arg_value("type","character",action = "is the type of the association to be computed")
#'
#' @details Currently, it is possible to compute the following metrics:
#'
#' \cr - Contingency association coefficient
#' \cr - Chi-square test statistic
#' \cr - Cramer's V association coefficient
#' \cr - Fisher test statistic
#' \cr - Phi association coefficent

#'
#' @return A numeric single value with the computed value.
#' @export
#'
#' @examples
#'
#' calc_association(mtcars$vs,mtcars$am)
#'


calc_association <-
  function(x,y,type = c("chi-square","contingency","cramers-v","fisher","phi")){

    stopifnot(is.character(type), length(type) == 1)

    stopifnot(length(x) == length(y))

    y_values <- unique(y)

    x_values <- unique(x)

    type <- match.arg(type)

    if(type %in% c("fisher","phi")){
      stopifnot((length(y_values) == 2 | length(x_values) == 2))
    }

    tbl_xy <- table(x,y)

    tbl_sum <- sum(tbl_xy,na.rm = TRUE)

    row_sum <- rowSums(tbl_xy,na.rm = TRUE)

    col_sum <- rowSums(tbl_xy,na.rm = TRUE)

    x2_test <- stats::chisq.test(tbl_xy)

    x2_stat <- as.numeric(x2_test[["statistic"]])

    n <- sum(x2_test[["observed"]])

    min_dim <- min(dim(x2_test[["observed"]]))

    # chi-square --------------------------------------------------------------

    if(type == "chi-square"){
      output <- x2_stat
    }

    # contingency --------------------------------------------------------------

    if(type == "contingency"){

      x2_test <- stats::chisq.test(tbl_xy,correct = FALSE)

      x2_stat <- as.numeric(x2_test[["statistic"]])

      output <- sqrt(x2_stat/(x2_stat+tbl_sum))
    }

    # cramers_v --------------------------------------------------------------

    if(type == "cramers-v"){
      output <- sqrt(x2_stat/(n * (min_dim - 1)))
    }

    # fisher --------------------------------------------------------------

    if(type == "fisher"){
      output <- stats::fisher.test(x = x,y = y)$estimate
    }

    # phi -----------------------------------------------------------------

    if(type == "phi"){

      dividend <- tbl_xy[1,1] * tbl_xy[2,2] - tbl_xy[1,2] * tbl_xy[2,1]

      divisor <- sqrt(row_sum[1] * row_sum[2] * col_sum[1] * col_sum[2])

      output <- dividend/divisor

    }


    # output ------------------------------------------------------------------

    return(unname(output))

  }
