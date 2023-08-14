#' Combination/Permutation computation
#'
#' @description Computation of number of combinations/permutations.
#'
#' @eval arg_value("n","numeric",action = "will be the total number of observations")
#' @eval arg_value("r","numeric",action = "will be the number of observations to be selected")
#' @eval arg_boolean("order_matter","be a permutation, if not a combination")
#' @eval arg_boolean("with_repetition","consider that there will be repetitions")
#'
#' @return A numeric single value.
#' @export
#'
#' @examples
#'
#' calc_combination(6,2)
#'
#' calc_combination(6,2,order_matter = TRUE,with_repetition = TRUE)
#'

calc_combination <- function(n,r,order_matter = FALSE,with_repetition = FALSE){

  stopifnot(is.numeric(n), n > 0, length(n) == 1)

  stopifnot(is.numeric(r), r > 0, length(n) == 1)

  stopifnot(n > r)

  stopifnot(is.logical(order_matter), length(order_matter) == 1)

  stopifnot(is.logical(with_repetition), length(order_matter) == 1)

  n <- as.integer(n)

  r <- as.integer(r)

  if(order_matter){

    if(with_repetition){

      output <- n^r

    }else{

      output <- factorial(n)/factorial(n-r)

    }

  }else{

    if(with_repetition){

      output <- factorial(r+n-1)/(factorial(r)*factorial(n-1))

    }else{

      output <- factorial(n)/(factorial(n-r)*factorial(r))

    }

  }

  return(output)

}
