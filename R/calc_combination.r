#' Combination/Permutation computation
#'
#' @description Computation of number of combinations/permutations.
#'
#' @eval arg_vector("n","numeric",action = "will be the total number of obervations")
#' @eval arg_vector("r","numeric",action = "will be the number of obervations to be selected")
#' @eval arg_boolean("order_matter","be a permutation, if not a combination")
#' @eval arg_boolean("with_repetition","consider that there will be repetitions")
#'
#' @return A numeric single value.
#' @export
#'
#' @examples
#'
#'
#' calc_computation(6,2)
#'
#' calc_computation(6,2,TRUE,FALSE)
#'

calc_combination <- function(n,r,order_matter = FALSE,with_repetition = FALSE){

  stopifnot(is.numeric(n), n >= 0, length(n) == 1)

  stopifnot(is.numeric(r), r >= 0, length(n) == 1)

  stopifnot(is.logical(order_matter))

  stopifnot(is.logical(with_repetition))

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
