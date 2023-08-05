#' Mean computation
#'
#' @description Computation of the mean (arithmetic,geometric and harmonic).
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("x","character")
#'
#' @return A numeric single value with the computed mean.
#'
#' @export
#'
#' @examples
#'
#' x <- rexp(100,.5)
#'
#' calc_mean(x,"geometric")
#'

calc_mean <- function(x,type = "arithmetic"){

  stopifnot(is.numeric(x))

  stopifnot(is.character(type))

  type <- tolower(type)

  stopifnot(type %in% c("arithmetic","geometric","harmonic"))

  if(type == "arithmetic"){

    output <- mean(x,na.rm = TRUE)

  }

  if(type == "geometric"){

    warn_any_zero(
      x  = x,
      warning = "At least one value = 0 and that caused the mean to be 0."
    )

    #log already provides warning for values < 0
    output <- suppressWarnings(exp(mean(log(x), na.rm = TRUE)))

  }

  if(type == "harmonic"){

    warn_any_zero(
      x  = x ,
      warning = "at least one value = 0 and that caused the mean to be 0."
    )

    output <- suppressWarnings(1/mean(1/x, na.rm = TRUE))

  }

  return(output)
}

