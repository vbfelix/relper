#' Mode computation
#'
#' @description Computation of the mode.
#'
#' @eval arg_vector("x","")
#'
#' @return A character vector with the computed mode(s).
#' @export
#'
#' @examples
#'
#' table(mtcars$cyl)
#'
#' calc_mode(mtcars$cyl)
#'

calc_mode <- function(x){

    levels <- unique(x)

    index <- tabulate(match(x, levels))

    mode_index <- index == max(index)

    if(length(mode_index) > 1){warning("The computed mode has ties, more than one result will be provided.")}

    output <- which(mode_index)

    return(output)

}

