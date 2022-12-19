#' Mode for character values
#'
#' @description Find the mode
#'
#' @param x character vector
#'
#' @return character value
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

