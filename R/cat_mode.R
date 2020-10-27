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
#' cat_mode(mtcars$cyl)
#'

cat_mode <- function(x){

    cat_levels <- unique(x)

    out <- cat_levels[which.max(tabulate(match(x, cat_levels)))]

    return(out)

}

