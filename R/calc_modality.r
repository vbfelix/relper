#' Modality computation
#'
#' @description The number of modes a dataset has.
#' It can be used to identify whether a dataset is unimodal, bimodal, or multimodal.
#'
#' @eval arg_vector("x","numeric")
#'
#' @return A single value.
#' @export
#'
#' @examples
#'
#' table(mtcars$cyl)
#'
#' calc_mode(mtcars$cyl)
#'
#' calc_modality(mtcars$cyl)
#'

calc_modality <- function(x){

    stop_function(arg = x,type = "numeric")

    output <- length(relper::calc_mode(x))

    return(output)

}

