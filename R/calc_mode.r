#' Mode computation
#'
#' @description Computation of the mode.
#'
#' @eval arg_vector("x","character")
#'
#' @return A character single value with the computed mode.
#' @export
#'
#' @examples
#'
#' table(mtcars$cyl)
#'
#' calc_mode(mtcars$cyl)
#'

calc_mode <- function(x){

    cat_levels <- unique(x)

    output <- cat_levels[which.max(tabulate(match(x, cat_levels)))]

    return(output)

}

