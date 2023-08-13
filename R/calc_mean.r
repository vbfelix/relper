#' Mean computation
#'
#' @description Computation of the mean (arithmetic,geometric and harmonic).
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_vector("type","character")
#' @eval arg_vector("trim","numeric",action = "will be fraction of data to be trimmed from both ends")
#' @eval arg_vector("weight","numeric",action = "will be the weight used for the weighted the arithmetic mean")
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

calc_mean <-
  function(
    x,
    type = c("arithmetic","geometric","harmonic"),
    trim = NULL,
    weight = NULL
  ){

    stopifnot(is.numeric(x))

    stopifnot(is.character(type))

    type <- match.arg(type)

    stopifnot(is.null(trim) | is.numeric(trim))

    if(!is.null(trim)){

      stopifnot(length(trim) == 1)

      stopifnot(trim > 0,trim < .5)

    }

    stopifnot(is.null(weight) | is.numeric(weight))

    if(!is.null(weight)){

      stopifnot(length(weight) == length(x))

      stopifnot(type == "arithmetic")

    }

    if(!is.null(trim)){

      x <- x[x > quantile(x,trim) & x < quantile(x,1-trim)]

    }

    if(type == "arithmetic"){

      if(is.null(weight)){

        output <- mean(x,na.rm = TRUE)

      }else{

        output <- weighted.mean(x = x,w = weight,na.rm = TRUE)

      }

    }

    if(type == "geometric"){

      warn_any_logic(
        x = x,
        operator = `<`,
        value = 0,
        warning = "Negative values will be ignored."
      )

      warn_any_zero(
        x  = x,
        warning = "At least one value = 0 and that caused the mean to be 0."
      )

      output <- suppressWarnings(exp(mean(log(x), na.rm = TRUE)))

    }

    if(type == "harmonic"){

      warn_any_zero(
        x  = x ,
        warning = "At least one value = 0 and that caused the mean to be 0."
      )

      output <- suppressWarnings(1/mean(1/x, na.rm = TRUE))

    }

    return(output)
  }

